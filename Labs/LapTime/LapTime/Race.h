//
//  Race.h
//  LapTime
//
//  Created by Olarn U. on 6/16/2557 BE.
//  Copyright (c) 2557 G-ABLE Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Race : NSManagedObject

@property (nonatomic, retain) NSDate * raceDate;
@property (nonatomic, retain) NSString * raceName;
@property (nonatomic, retain) NSSet *laps;
@end

@interface Race (CoreDataGeneratedAccessors)

- (void)addLapsObject:(NSManagedObject *)value;
- (void)removeLapsObject:(NSManagedObject *)value;
- (void)addLaps:(NSSet *)values;
- (void)removeLaps:(NSSet *)values;

@end
