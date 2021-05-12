//
//  Customer.m
//  ObjectiveCClass
//
//  Created by Olarn U. on 10/12/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (void)setFirstName:(NSString *)fName {
    firstName = fName;
}

- (void)setLastName:(NSString *)lName {
    lastName = lName;
}

- (NSString *)getFullname {
    return [NSString stringWithFormat:@"%@ %@", firstName, lastName];
}

@end
