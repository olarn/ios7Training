//
//  ViewController.h
//  MyDatePicker
//
//  Created by Olarn U. on 10/15/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray * monthArray;
    NSArray * yearArray;
    
    NSString * selectedYear;
    NSString * selectedMonth;
}

@property (weak, nonatomic) IBOutlet UILabel *txtResult;

- (void)setResultText;

@end
