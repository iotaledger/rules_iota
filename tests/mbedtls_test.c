/*
 * test via mbedtls/programs/ssl/ssl_server
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "unity/unity.h"

#include "mbedtls/config.h"
#include "mbedtls/net_sockets.h"
#include "mbedtls/debug.h"
#include "mbedtls/ssl.h"
#include "mbedtls/entropy.h"
#include "mbedtls/ctr_drbg.h"
#include "mbedtls/error.h"
#include "mbedtls/certs.h"

#define DEBUG_LEVEL 1
#define HOST_NAME "localhost"
#define HOST_PORT "4433"
static char *POST_REQUEST = "GET / HTTP/1.1\r\n\r\n";

static void ssl_debug(void *ctx, int level,
                      const char *file, int line,
                      const char *str)
{
  ((void)level);
  fprintf((FILE *)ctx, "%s:%04d: %s", file, line, str);
}

void test_ssl_client()
{
  int ret = -1, len;
  uint32_t flags;
  mbedtls_net_context server_fd;
  uint8_t buf[4096];

  mbedtls_entropy_context entropy;
  mbedtls_ctr_drbg_context ctr_drbg;
  mbedtls_ssl_context ssl;
  mbedtls_ssl_config conf;
  mbedtls_x509_crt cacert;
#if defined(MBEDTLS_DEBUG_C)
  mbedtls_debug_set_threshold(DEBUG_LEVEL);
#endif

  // Initialize the RNG and the session data
  mbedtls_net_init(&server_fd);
  mbedtls_ssl_init(&ssl);
  mbedtls_ssl_config_init(&conf);
  mbedtls_x509_crt_init(&cacert);
  mbedtls_ctr_drbg_init(&ctr_drbg);

  // testing RNG
  printf("Seeding the random number generator...\n");
  char const *personal = "mbedtls_test";
  mbedtls_entropy_init(&entropy);
  ret = mbedtls_ctr_drbg_seed(&ctr_drbg, mbedtls_entropy_func,
                              &entropy, (const unsigned char *)personal, strlen(personal));
  TEST_ASSERT(ret == 0);

  // Loading CA certification
  printf("Loading the CA root certificate ...\n");
  ret = mbedtls_x509_crt_parse(&cacert, (const unsigned char *)mbedtls_test_cas_pem,
                               mbedtls_test_cas_pem_len);
  TEST_ASSERT(ret == 0);

  // clean up
  mbedtls_net_free(&server_fd);
  mbedtls_x509_crt_free(&cacert);
  mbedtls_ssl_free(&ssl);
  mbedtls_ssl_config_free(&conf);
  mbedtls_ctr_drbg_free(&ctr_drbg);
  mbedtls_entropy_free(&entropy);
}

int main(void)
{
  UNITY_BEGIN();

  RUN_TEST(test_ssl_client);

  return UNITY_END();
}
