#include <iostream>

int foo(int, int);

int main()
{
	int num_evens = foo(3, 11);

	std::cout << "Number of even values should be 4: " << num_evens << std::endl;
	return 0;
}
