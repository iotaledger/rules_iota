#include <array>
#include <cstdint>
#include <functional>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

#include <argon2.h>
#include <sodium.h>

#define BYTE_LEN 64

int main() {
  std::string dataToHash = "abcdefgh";
  std::string salt = "abcdefgh";
  std::string message = "thisisamessage";

  std::array<uint8_t, BYTE_LEN> byteSeed;

  argon2i_hash_raw(4, 1 << 17, 1, dataToHash.c_str(), dataToHash.size(),
                   salt.c_str(), salt.size(), byteSeed.data(), BYTE_LEN);

  crypto_auth_hmacsha512_state state;
  unsigned char hash[crypto_auth_hmacsha512_BYTES];
  unsigned char key[crypto_auth_hmacsha512_KEYBYTES];

  crypto_auth_hmacsha512_init(&state, key, sizeof key);

  return 0;
}
