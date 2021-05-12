//
//  main.m
//  ObjectiveCClass
//
//  Created by Olarn U. on 10/12/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer2.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Customer2 *c = [[Customer2 alloc] init];
        
        c.firstName = @"Harry";
        c.lastName = @"Potter";
        
        NSLog(@"Hello, %@", [c getFullName]);
        
    }
    return 0;
}

