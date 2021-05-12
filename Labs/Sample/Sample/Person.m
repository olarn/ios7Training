//
//  Person.m
//  Sample
//
//  Created by Olarn U. on 11/16/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)personName
{
    if (!personName) {
        name = [@"NONAME" retain];
        
    } else
        name = personName;
}

- (NSString *)getName
{
    if (name) {
        return name;
    } else
        return [@"NONAME" autorelease];
}

- (void)dealloc
{
    [name release];
}

@end
