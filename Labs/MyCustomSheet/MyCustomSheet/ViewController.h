//
//  ViewController.h
//  MyCustomSheet
//
//  Created by Olarn U. on 10/15/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SheetDateViewController.h"

@interface ViewController : UIViewController <SheetDateViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtDate;
@property (strong, nonatomic) SheetDateViewController * sheetView;

- (IBAction)btnOpenDialogTapped:(id)sender;

@end
