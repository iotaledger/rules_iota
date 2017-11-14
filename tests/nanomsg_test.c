#include <stdio.h>
#include <string.h>

#include <nanomsg/nn.h>
#include <nanomsg/pipeline.h>

int main(const int argc, const char **argv) {
  int sock = nn_socket(AF_SP, NN_PUSH);
  nn_shutdown(sock, 0);
  return 0;
}
