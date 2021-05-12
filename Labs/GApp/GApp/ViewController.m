//
//  ViewController.m
//  GApp
//
//  Created by Olarn U. on 10/13/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@implementation ViewController

- (IBAction)btnLogoutTouched:(id)sender
{
    LoginViewController * loginViewController = [LoginViewController getInstance];
    
    UIViewController * rootViewController = [[[[UIApplication sharedApplication] windows] objectAtIndex:0] rootViewController];
    [rootViewController presentViewController:loginViewController
                                     animated:YES
                                   completion:nil];
}

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


@end
