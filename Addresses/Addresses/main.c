#include <stdio.h>

int main(int argc, const char * argv[]) {
    // pointers and addresses
    
    // the address of a var is the location in
    // memory where the value for that variable is stored
    
    int i = 17;
     printf("i stores its value at %p.\n", &i);
    
    // declare a variable that is a pointer to an int - not to THE value of the int
    int *addressOfI = &i;
    // print its address
    printf("i stores its value at %p.\n", addressOfI);
    
    // print the address of this function
    printf("this function starts at %p.\n", main);
    
    // getting the data at an address
    printf("the int stored at address addressOfI is %d.\n", *addressOfI);
    
    // you can also explicitly set the address of the data by putting the
    // * on the left side of the operator
    *addressOfI = 89;
    printf("Now i is %d.\n", i);
    
    return 0;
}
