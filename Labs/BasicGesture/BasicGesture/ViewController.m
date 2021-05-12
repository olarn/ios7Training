//
//  ViewController.m
//  BasicGesture
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
    
    UISwipeGestureRecognizer *swipeLeftRight = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget:self
                                                action:@selector(swipeRecognized:)];
    [swipeLeftRight setDirection:(UISwipeGestureRecognizerDirectionRight |
                                  UISwipeGestureRecognizerDirectionLeft )];
    [self.view addGestureRecognizer:swipeLeftRight];
    
    UISwipeGestureRecognizer *swipeUpDown = [[UISwipeGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(swipeRecognized:)];
    [swipeUpDown setDirection:(UISwipeGestureRecognizerDirectionUp |
                               UISwipeGestureRecognizerDirectionDown )];
    [self.view addGestureRecognizer:swipeUpDown];
}

- (void)swipeRecognized:(UIGestureRecognizer *)recognizer
{
	NSLog(@"Seem like swipe...");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
