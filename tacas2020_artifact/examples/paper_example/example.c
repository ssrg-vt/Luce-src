#include <stdbool.h>

bool is_even(int arg1) {
	return arg1 % 2 == 0;
}

int main(int argc, char* argv[]) {
	int* a = (int*)argv;
	int* b = (int*)(argv + 4);
	*(int*)(argv + 2) = *a + *b;
	*(char*)argv = 'a';

	int array[argc];

	for (int i = 0; i < argc; i++) {
		array[i] = argv[i][0] * 2;
	}

	if (is_even(argc)) {
		return array[argc];
	}

	return array[0];
}
