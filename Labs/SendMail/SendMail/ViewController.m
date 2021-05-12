//
//  ViewController.m
//  SendMail
//
//  Created by Olarn U. on 10/14/2556 BE.
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

- (IBAction)btnActionTouched:(id)sender
{
    if ([self.txtTo.text isEqualToString:@""]) {
        
        [[[UIAlertView alloc] initWithTitle:@"Email Require"
                                    message:@"ยังไม่ได้ระบุ Email ปลายทาง"
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil] show];

    } else {
        
        [self.txtTo resignFirstResponder];
        
        NSString * sendTitle = [NSString stringWithFormat:@"Send to %@", self.txtTo.text];
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"Send Email"
                                                                  delegate:self
                                                         cancelButtonTitle:@"Don't Send"
                                                    destructiveButtonTitle:sendTitle
                                                         otherButtonTitles:nil, nil];
        [actionSheet showInView:self.view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        [[[UIAlertView alloc] initWithTitle:@"Done"
                                   message:@"Do you want to save copy?"
                                  delegate:self
                         cancelButtonTitle:@"No"
                          otherButtonTitles:@"Yes", nil] show];
    } else {
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Login"
                                                         message:@"Please enter username & password"
                                                        delegate:nil
                                               cancelButtonTitle:@"Cancel"
                                               otherButtonTitles:@"Login", nil];
        alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
        [alert show];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString * alertMsg;
    switch (buttonIndex) {
        case 0:
            alertMsg = @"Message discarded.";
            break;
            
        default:
            alertMsg = @"Message saved.";
            break;
    }
    [[[UIAlertView alloc] initWithTitle:@"Save..."
                                message:alertMsg
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
}

@end
