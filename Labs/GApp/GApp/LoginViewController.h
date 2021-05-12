//
//  LoginViewController.h
//  GApp
//
//  Created by Olarn U. on 10/13/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

+ (LoginViewController *)getInstance;

- (IBAction)btnLoginTouched:(id)sender;

@end
