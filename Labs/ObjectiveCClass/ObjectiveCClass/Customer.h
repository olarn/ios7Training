//
//  Customer.h
//  ObjectiveCClass
//
//  Created by Olarn U. on 10/12/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject
{
    NSString * firstName;
    NSString * lastName;
}

@property(retain)NSString *firstName;
@property(retain)NSString *lastName;

- (void)setFirstName:(NSString *)fName;
- (void)setLastName:(NSString *)lName;
- (NSString *)getFullname;

@end
