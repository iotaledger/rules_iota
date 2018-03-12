#include <keccak/KeccakHash.h>

int main(int argc, char** argv) {
	Keccak_HashInstance keccak;

	unsigned int rate = 832;
	unsigned int capacity = 768;
	unsigned int hashbitlen = 384;
	unsigned char delimitedSuffix = 0x01;

	return Keccak_HashInitialize(&keccak, rate, capacity, hashbitlen, delimitedSuffix);
};
