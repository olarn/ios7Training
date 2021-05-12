//
//  Person.h
//  Sample
//
//  Created by Olarn U. on 11/16/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString * name;
}

@property (nonatomic, retain) NSString * name;

- (void)setName:(NSString *)personName;
- (NSString *)getName;

@end
