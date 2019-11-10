#include <iostream>

int main(int argc, char const *argv[])
{
	uint32_t reg = 0b11111'1111;
	int nr_val = 511;
	for (int i = 0; i < nr_val; i++) {
		std::cout << (reg & 1) << " ";

		uint8_t last_bit = !!((1 << 0) & reg) != !!((1 << 4) & reg);
		reg >>= 1;
		reg = reg | (last_bit << 8);
	}
	std::cout << std::endl;
	return 0;
}