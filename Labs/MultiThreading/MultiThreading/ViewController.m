//
//  ViewController.m
//  MultiThreading
//
//  Created by Olarn U. on 10/31/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.worker = [[Worker alloc] init];
}

- (void)doSomething
{
    int (^multiply)(int, int) = ^(int x, int y) {
        return x * y;
    };
    
    int result = multiply(5,10);
    NSLog(@"%i", result);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(id)sender
{
    self.txtValue.text = [NSString stringWithFormat:@"%0.1f", self.slider.value];
    self.worker.sleepInterval = self.slider.value;
}

- (IBAction)btnGoTapped:(id)sender
{
    [self.activityView startAnimating];
    [self.worker doWorkForSleepInterval:self.slider.value
                             onProgress:^(int currentProgress) {
                                 float x = currentProgress;
                                 self.progressView.progress = x / 100.0f;
                             }
                               onFinish:^{
                                   self.progressView.progress = 0;
                                   [self.activityView stopAnimating];
                               }];
    
    
    [self.worker doWorkForSleepInterval:0.0
                             onProgress:^(int currentProgress) {
                                 
                             } onFinish:^{
                                 
                             }];
    
}

@end













