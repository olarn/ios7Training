//
//  Customer2.m
//  ObjectiveCClass
//
//  Created by Olarn U. on 10/12/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "Customer2.h"

@implementation Customer2

- (NSString *)getFullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
