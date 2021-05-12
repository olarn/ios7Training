//
//  Worker.h
//  MultiThreading
//
//  Created by Olarn U. on 10/31/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onProgressBlock) (int currentProgress);
typedef void (^onFinishBlock) ();

@interface Worker : NSObject
{
    __strong onProgressBlock progressBlockObj;
    __strong onFinishBlock finishBlockObj;

}

@property (atomic) double sleepInterval;

- (void)doWorkForSleepInterval:(double)sleepTime
                    onProgress:(onProgressBlock)progress
                      onFinish:(onFinishBlock)finish;

- (void)doWorkForSleepInterval:(double)sleepTime
                    onProgress:(int (^) (int))progress;

@end
