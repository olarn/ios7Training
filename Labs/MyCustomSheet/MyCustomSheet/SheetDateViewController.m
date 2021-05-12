//
//  SheetDateViewController.m
//  MyCustomSheet
//
//  Created by Olarn U. on 10/15/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "SheetDateViewController.h"

@interface SheetDateViewController ()

@end

@implementation SheetDateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSelectTapped:(id)sender
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat posToLand = screenRect.size.height;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.view.frame = CGRectMake(0, posToLand, 320, 460);
                     }
                     completion:^(BOOL finished) {
                         [self.view removeFromSuperview];
                     }];
    if (self.delegate)
        [self.delegate didSelectDate:self.datePicker.date];
}

@end
