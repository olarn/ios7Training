//
//  ViewController.h
//  MyUniversalApp
//
//  Created by Olarn U. on 10/14/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtUrl;
@property (weak, nonatomic) IBOutlet UIWebView *wView;

- (IBAction)btnGoTouched:(id)sender;

@end