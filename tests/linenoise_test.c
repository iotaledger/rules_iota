#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "linenoise.h"

void completion(const char *buf, linenoiseCompletions *lc) {
  if (buf[0] == 'h') {
    linenoiseAddCompletion(lc, "hello");
    linenoiseAddCompletion(lc, "hello there");
  }
}

char *hints(const char *buf, int *color, int *bold) {
  if (!strcasecmp(buf, "hello")) {
    *color = 35;
    *bold = 0;
    return " World";
  }
  return NULL;
}

int main() {
  /* Set the completion callback. This will be called every time the
   * user uses the <tab> key. */
  linenoiseSetCompletionCallback(completion);
  linenoiseSetHintsCallback(hints);

  /* Load history from file. The history file is just a plain text file
   * where entries are separated by newlines. */
  linenoiseHistoryLoad("history.txt"); /* Load the history at startup */

  return 0;
}
