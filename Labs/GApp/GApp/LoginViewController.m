//
//  LoginViewController.m
//  GApp
//
//  Created by Olarn U. on 10/13/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "LoginViewController.h"

static LoginViewController * loginViewController;

@implementation LoginViewController

+ (LoginViewController *)getInstance
{
    if (!loginViewController) {
        loginViewController = [[LoginViewController alloc] init];
    }
    return loginViewController;
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoginTouched:(id)sender
{
    if ([self.txtUserName.text isEqualToString:@"user"] && [self.txtPassword.text isEqualToString:@"1234"]) {
        self.txtUserName.text = @"";
        self.txtPassword.text = @"";
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
