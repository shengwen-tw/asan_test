#include <stdlib.h>

int main(void)
{
	char *memory = (char *)malloc(sizeof(char) * 100);

	free(memory);

	return memory[3];
}
