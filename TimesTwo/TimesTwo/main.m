#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSDate *currentTime = nil;
        // value is 0x0.
        
        NSDate *currentTime = [NSDate date];
        // address is 0x1001121f0.
        
        NSLog(@"currentTime's value is %p.\n", currentTime);
        
        sleep(2);
        
        currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p.\n", currentTime);
        
        /* memory management:
         The original currentTime is deleted to save memory.
         It is assumed the data at that address is no longer needed
         because you reassigned the var
         This is why you use ARC - Automatic Reference Counting
         
         pg. 198
         As long as you have a pointer to an object, you can be sure that it will continue to exist.
         You will never explicitly destroy an object, as you would with buffer free() (C)
         You can only add or remove a reference to the object.
         The object will destroy itself when its reference count equals 0.
         
         What is you are done with an object? You set the pointer to nil, or let the 
         pointer be destroyed when it falls out of scpoe.
         */
    }
    return 0;
}
