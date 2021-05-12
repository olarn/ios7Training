//
//  main.m
//  Sample
//
//  Created by Olarn U. on 11/15/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
       
        Person * p = [[Person alloc] init];
        [p setName:@"Steve Jobs"];
        NSString * name = [p getName];
        [name retain];
        [p release];
        
        // use person's name ...
        
        [name release];
    }
    return 0;
}

