#include <liblfds711.h>
#include <stdio.h>
#include <string.h>

struct test_data {
  char name[64];
};

int main() {
  struct lfds711_queue_bmm_element qbmme[8]; // TRD : must be a positive integer
                                             // power of 2 (2, 4, 8, 16, etc)
  struct lfds711_queue_bmm_state qbmms;
  struct test_data td, *temp_td;

  lfds711_queue_bmm_init_valid_on_current_logical_core(&qbmms, qbmme, 8, NULL);
  strcpy(td.name, "Madge The Skutter");
  lfds711_queue_bmm_enqueue(&qbmms, NULL, &td);
  lfds711_queue_bmm_dequeue(&qbmms, NULL, &temp_td);
  printf("skutter name = %s\n", temp_td->name);
  lfds711_queue_bmm_cleanup(&qbmms, NULL);

  return (0);
}
