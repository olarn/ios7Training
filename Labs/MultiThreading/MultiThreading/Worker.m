//
//  Worker.m
//  MultiThreading
//
//  Created by Olarn U. on 10/31/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "Worker.h"

@interface Worker (Private)
- (void)doBackgroundThread;
@end

@implementation Worker

- (void)doWorkForSleepInterval:(double)sleepTime
                    onProgress:(int (^) (int))progress
{
    if (progress) {
        progress(10);
    }
}

- (void)doWorkForSleepInterval:(double)sleepTime
                    onProgress:(onProgressBlock)progress
                      onFinish:(onFinishBlock)finish
{
    progressBlockObj = progress;
    finishBlockObj = finish;
    
    self.sleepInterval = sleepTime;
    [NSThread detachNewThreadSelector:@selector(doBackgroundThread)
                             toTarget:self
                           withObject:nil];
}

- (void)doBackgroundThread
{
    for (int i = 0; i <= 100; i++) {
        [NSThread sleepForTimeInterval:self.sleepInterval];
        NSLog(@"Current value = %i", i);

        [self performSelectorOnMainThread:@selector(updateProgress:)
                               withObject:[NSNumber numberWithInt:i]
                            waitUntilDone:NO];
    }
    
    [self performSelectorOnMainThread:@selector(finish) withObject:nil waitUntilDone:NO];
}

- (void)updateProgress:(NSNumber *)currentProgress
{
    if (progressBlockObj) {
        progressBlockObj([currentProgress intValue]);
    }
}

- (void)finish
{
    if (finishBlockObj) {
        finishBlockObj();
    }
}

@end
