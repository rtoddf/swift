#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSHost *name = [NSHost currentHost];
        
        NSLog(@"Address: %p.\n", name);
        NSLog(@"actual value: %@.\n", name);
        
        NSString *localName = [name localizedName];
        NSLog(@"actual value: %@.\n", localName);
        
    }
    return 0;
}
