//
//  ViewController.m
//  BasicTouch
//
//  Created by Olarn U. on 11/11/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (self.trackedTouch == nil) {
		self.trackedTouch = [touches anyObject];
		self.startPoint = [self.trackedTouch locationInView:self.view];
        NSLog(@"Touch Begin");
	}
}

#define MIN_SWIPE_X_THRESHOLD 30
#define MAX_SWIPE_Y_THRESHOLD 30

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGPoint currentPoint = [self.trackedTouch locationInView:self.view];
	if ((currentPoint.x - self.startPoint.x > MIN_SWIPE_X_THRESHOLD) &&
		(ABS(currentPoint.y - self.startPoint.y) < MAX_SWIPE_Y_THRESHOLD))
	{
		NSLog(@"Seem like swipe...");
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (self.trackedTouch && [touches containsObject:self.trackedTouch]) {
		self.trackedTouch = nil;
		NSLog(@"Release track touch");
	}
}


@end
