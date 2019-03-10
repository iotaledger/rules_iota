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

  // Start the connection
  printf("Connecting to tcp/%s/%s...\n", HOST_NAME, HOST_PORT);
  ret = mbedtls_net_connect(&server_fd, HOST_NAME, HOST_PORT, MBEDTLS_NET_PROTO_TCP);
  TEST_ASSERT(ret == 0);

  // This is a client
  printf("Client setup...\n");
  ret = mbedtls_ssl_config_defaults(&conf, MBEDTLS_SSL_IS_CLIENT,
                                    MBEDTLS_SSL_TRANSPORT_STREAM, MBEDTLS_SSL_PRESET_DEFAULT);
  TEST_ASSERT(ret == 0);

  /* OPTIONAL is not optimal for security,
		* but makes interop easier in this simplified example */
  mbedtls_ssl_conf_authmode(&conf, MBEDTLS_SSL_VERIFY_OPTIONAL);
  mbedtls_ssl_conf_ca_chain(&conf, &cacert, NULL);
  mbedtls_ssl_conf_rng(&conf, mbedtls_ctr_drbg_random, &ctr_drbg);
  mbedtls_ssl_conf_dbg(&conf, ssl_debug, stdout);

  printf("configuration...\n");
  ret = mbedtls_ssl_setup(&ssl, &conf);
  TEST_ASSERT(ret == 0);

  printf("set host...\n");
  ret = mbedtls_ssl_set_hostname(&ssl, HOST_NAME);
  TEST_ASSERT(ret == 0);

  // BIO callbacks
  mbedtls_ssl_set_bio(&ssl, &server_fd, mbedtls_net_send, mbedtls_net_recv, NULL);

  // Handshake
  printf("Performing the SSL/TLS handshake...\n");

  while ((ret = mbedtls_ssl_handshake(&ssl)) != 0)
  {
    if (ret != MBEDTLS_ERR_SSL_WANT_READ && ret != MBEDTLS_ERR_SSL_WANT_WRITE)
    {
      printf(" failed\n  ! mbedtls_ssl_handshake returned -0x%x\n\n", -ret);
      TEST_FAIL_MESSAGE("test handshake failed");
    }
  }

  // Verify the server certificate
  if ((flags = mbedtls_ssl_get_verify_result(&ssl)) != 0)
  {
    char vrfy_buf[512];
    mbedtls_x509_crt_verify_info(vrfy_buf, sizeof(vrfy_buf), "  ! ", flags);
    printf("%s\n", vrfy_buf);
  }

  // Write the POST request
  len = sprintf((char *)buf, "%s", POST_REQUEST);
  while ((ret = mbedtls_ssl_write(&ssl, buf, len)) <= 0)
  {
    if (ret != MBEDTLS_ERR_SSL_WANT_READ && ret != MBEDTLS_ERR_SSL_WANT_WRITE)
    {
      printf(" failed! mbedtls_ssl_write returned %d\n", ret);
      TEST_FAIL_MESSAGE("Verify the server certificate failed");
    }
  }

  // Read the HTTP response
  do
  {
    len = sizeof(buf) - 1;
    memset(buf, 0, sizeof(buf));
    ret = mbedtls_ssl_read(&ssl, buf, len);

    if (ret == MBEDTLS_ERR_SSL_WANT_READ || ret == MBEDTLS_ERR_SSL_WANT_WRITE)
      continue;

    if (ret == MBEDTLS_ERR_SSL_PEER_CLOSE_NOTIFY)
      break;

    if (ret < 0)
    {
      printf("failed! mbedtls_ssl_read returned %d\n\n", ret);
      break;
    }

    if (ret == 0)
    {
      printf("\n\nEOF\n\n");
      break;
    }

    len = ret;
    printf(" %d bytes read\n\n%s", len, (char *)buf);
  } while (1);

  mbedtls_ssl_close_notify(&ssl);

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
