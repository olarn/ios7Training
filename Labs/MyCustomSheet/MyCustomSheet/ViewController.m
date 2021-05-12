//
//  ViewController.m
//  MyCustomSheet
//
//  Created by Olarn U. on 10/15/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat posToLand = screenRect.size.height;
    
    self.sheetView = [self.storyboard instantiateViewControllerWithIdentifier:@"sheetView"];
    self.sheetView.view.frame = CGRectMake(0, posToLand, 320, 460);
    self.sheetView.delegate = self;
}

- (void)didSelectDate:(NSDate *)selectedDate
{
    self.txtDate.text = [NSString stringWithFormat:@"%@", selectedDate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnOpenDialogTapped:(id)sender
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat posToLand = screenRect.size.height - 242;
    
    [self.view addSubview:self.sheetView.view];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.sheetView.view.frame = CGRectMake(0, posToLand, 320, 460);
                     }];
}

@end
