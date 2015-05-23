#include <stdio.h>

int main(int argc, const char * argv[]) {
    // using sizeof() you can find the size of a data type
    int i = 32;
    int *addressOfI = &i;
    printf("i stores its value at %p.\n", addressOfI);
    
    printf("an int is %zu bytes.\n", sizeof(i));
    printf("an int is %zu bytes.\n", sizeof(int));
    
    printf("a pointer is %zu bytes.\n", sizeof(addressOfI));
    printf("a pointer is %zu bytes.\n", sizeof(int *));
    
    // the size function returns a value of type size_t,
    // so you'll use %zu
    
    // if your pointer is 4 bits, you're running in 32-bit mode
    // if your pointer is 8 bits, you're running in 64-bit mode
    
    float j = 10.0;
    float *addressOfJ = &j;
    printf("A float holds %zu bytes.\n", sizeof(j));
    printf("The pointer to a float hold %zu bytes.\n", sizeof(addressOfJ));
    
    return 0;
}
