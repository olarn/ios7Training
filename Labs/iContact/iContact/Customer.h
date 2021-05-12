//
//  Customer.h
//  iContact
//
//  Created by Olarn U. on 11/1/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject

@property (nonatomic, strong) NSString * firstName;
@property (nonatomic, strong) NSString * lastName;
@property (nonatomic, strong) NSString * company;
@property (nonatomic, strong) NSString * imageName;
@property (nonatomic, strong) UIImage * image;

@end
