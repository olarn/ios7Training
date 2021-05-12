//
//  ViewController.h
//  MultiThreading
//
//  Created by Olarn U. on 10/31/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Worker.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) Worker * worker;

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *txtValue;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)btnGoTapped:(id)sender;

@end
