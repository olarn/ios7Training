//
//  Lap.h
//  LapTime
//
//  Created by Olarn U. on 6/16/2557 BE.
//  Copyright (c) 2557 G-ABLE Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Race;

@interface Lap : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) Race *race;

@end
