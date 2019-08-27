#include <mysql.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  MYSQL *mysql;

  mysql = mysql_init(NULL);

  mysql_close(mysql);

  return 0;
}
