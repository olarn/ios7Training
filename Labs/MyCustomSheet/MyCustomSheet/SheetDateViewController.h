//
//  SheetDateViewController.h
//  MyCustomSheet
//
//  Created by Olarn U. on 10/15/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SheetDateViewControllerDelegate <NSObject>
- (void)didSelectDate:(NSDate *)selectedDate;
@end

@interface SheetDateViewController : UIViewController

@property (assign, nonatomic) id<SheetDateViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)btnSelectTapped:(id)sender;

@end
