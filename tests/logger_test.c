#include "logger.h"
#include <time.h>
#include <stdio.h>

static void printer(const char *string)
{
    char   date[200];
    time_t t;

    t = time(NULL);
    strftime(date, sizeof(date), "%Y-%m-%d %H:%M:%S", localtime(&t));
    printf("%s: %s", date, string);
}


int main(void)
{
    FILE        *stream;
    logger_id_t id = logger_id_unknown;

    /* check logger version */
    if (LOGGER_VERSION != logger_version()) {
        return(1);
    }

    /* initialize logger */
    logger_init();

    /* open a file as output for all messages */
    stream = fopen("logfile_test", "w");
    logger_output_register(stream);
    logger_output_level_set(stream, LOGGER_DEBUG);

    /* open stdout as output for messages above LOGGER_ERR */
    logger_output_register(stdout);
    logger_output_level_set(stdout, LOGGER_ERR);

    /* register user function for messages above LOGGER_INFO */
    logger_output_function_register(printer);
    logger_output_function_level_set(printer, LOGGER_INFO);

    /* get a logging id, enable it and set log level */
    id = logger_id_request("logger_test_id");
    logger_id_enable(id);
    logger_id_level_set(id, LOGGER_INFO);
    logger_id_prefix_set(id, (LOGGER_PFX_DATE | LOGGER_PFX_NAME | LOGGER_PFX_LEVEL | LOGGER_PFX_FILE | LOGGER_PFX_FUNCTION | LOGGER_PFX_LINE));
    logger_color_prefix_enable();
    logger_color_message_enable();
    logger_id_color_console_set(id, LOGGER_FG_GREEN, LOGGER_BG_BLACK, LOGGER_ATTR_BRIGHT | LOGGER_ATTR_UNDERLINE);

    /* do the logging */
    logger(id, LOGGER_DEBUG,    "id %d - LOGGER_DEBUG   in line %d\n", id, __LINE__); /* nothing written */
    logger(id, LOGGER_INFO,     "id %d - LOGGER_INFO    in line %d\n", id, __LINE__); /* written to logfile */
    logger(id, LOGGER_NOTICE,   "id %d - LOGGER_NOTICE  in line %d\n", id, __LINE__); /* written to logfile */
    logger(id, LOGGER_WARNING,  "id %d - LOGGER_WARNING in line %d\n", id, __LINE__); /* written to logfile */
    logger(id, LOGGER_ERR,      "id %d - LOGGER_ERR     in line %d\n", id, __LINE__); /* written to logfile and stdout */
    logger(id, LOGGER_CRIT,     "id %d - LOGGER_CRIT    in line %d\n", id, __LINE__); /* written to logfile and stdout */
    logger(id, LOGGER_ALERT,    "id %d - LOGGER_ALERT   in line %d\n", id, __LINE__); /* written to logfile and stdout */
    logger(id, LOGGER_EMERG,    "id %d - LOGGER_EMERG   in line %d\n", id, __LINE__); /* written to logfile and stdout */

    /* release id */
    logger_id_release(id);

    /* deregister user function */
    logger_output_function_deregister(printer);

    /* deregister stdout output */
    logger_output_deregister(stdout);

    /* deregister file output */
    logger_output_deregister(stream);

    /* close file */
    fclose(stream);

    return(0);
}