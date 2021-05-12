//
//  ViewController.m
//  MyUniversalApp
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


- (IBAction)btnGoTouched:(id)sender
{
    [self.txtUrl resignFirstResponder];
    NSURL *url = [NSURL URLWithString:self.txtUrl.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.wView loadRequest:request];
}


@end
