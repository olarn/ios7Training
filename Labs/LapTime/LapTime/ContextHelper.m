//
//  ContextHelper.m
//  LabTime
//
//  Created by Olarn U. on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContextHelper.h"

@implementation ContextHelper

static NSManagedObjectContext *managedObjectContext_ = nil;
static NSManagedObjectModel *managedObjectModel_ = nil;
static NSPersistentStoreCoordinator *persistentStoreCoordinator_ = nil;

static NSURL *dbPath;
static NSURL *modelPath;

static NSEntityDescription *entity;

+ (NSManagedObjectContext *)getManagedObjectContext {
    if (managedObjectContext_ != nil) {
		return managedObjectContext_;
	}
	
	dbPath = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory 
                                                      inDomains:NSUserDomainMask]
               lastObject] URLByAppendingPathComponent:@"LapTime.sqlite"];
    
	modelPath = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
	
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelPath];  
	
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES],                          						NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES],
                             NSInferMappingModelAutomaticallyOption, nil];

    NSError *error = nil;
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel_];
    
	if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType 
												   configuration:nil 
															 URL:dbPath 
														 options:options
														   error:&error]) 
	{        
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    } 
	
    if (persistentStoreCoordinator_ != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
        [managedObjectContext_ setPersistentStoreCoordinator:persistentStoreCoordinator_];
    }	
   	
	return managedObjectContext_;
}

+ (id)insertNewObjectForEntityForName:(NSString *)className {
    return [NSEntityDescription insertNewObjectForEntityForName:className inManagedObjectContext:[self getManagedObjectContext]];
}

+ (void)saveContext {
    NSError *error = nil;
    if (managedObjectContext_ != nil) {
        if ([managedObjectContext_ hasChanges] && ![managedObjectContext_ save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

+ (void)deleteObjectFromContext:(id)object {
    [[self getManagedObjectContext] deleteObject:object];
}

+ (NSMutableArray *)getAllObjectsFromEntity:(NSString *)entityName initWithKey:(NSString *)keyName ascending:(bool)ascending {
    
    entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self getManagedObjectContext]];
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:keyName ascending:ascending];
	NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
	
	[request setSortDescriptors:sortDescriptors];
	
	NSError *error;
    NSMutableArray *mutableFetchResults = [[managedObjectContext_ executeFetchRequest:request error:&error] mutableCopy];
	
	if (!mutableFetchResults) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	}
	
	return mutableFetchResults;
}

@end
