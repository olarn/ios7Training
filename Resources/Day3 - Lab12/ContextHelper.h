//
//  ContextHelper.h
//  LabTime
//
//  Created by Olarn U. on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ContextHelper : NSObject

+ (NSManagedObjectContext *)getManagedObjectContext;
+ (id)insertNewObjectForEntityForName:(NSString *)className;
+ (void)saveContext;
+ (void)deleteObjectFromContext:(id)object;
+ (NSMutableArray *)getAllObjectsFromEntity:(NSString *)entityName initWithKey:(NSString *)keyName ascending:(bool)ascending;

@end
