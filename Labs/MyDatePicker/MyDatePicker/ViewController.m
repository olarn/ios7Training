//
//  ViewController.m
//  MyDatePicker
//
//  Created by Olarn U. on 10/15/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    yearArray = [[NSArray alloc] initWithObjects:@"2553", @"2554", @"2555", @"2556", @"2557", @"2558", nil];
    
    monthArray = [[NSArray alloc] initWithObjects:
                  @"มกราคม", @"กุมภาพันธ์", @"มีนาคม", @"เมษายน", @"พฤษภาคม", @"มิถุนายน", @"กรกฎาคม", @"สิงหาคม", @"กันยายน", @"ตุลาคม", @"พฤษจิกายน", @"ธันวาคม" ,nil];
                  
    selectedYear = [yearArray objectAtIndex:0];
    selectedMonth = [monthArray objectAtIndex:0];
    
    [self setResultText];
}

- (void)setResultText
{
    self.txtResult.text = [NSString stringWithFormat:@"คุณเลือก %@ %@", selectedMonth, selectedYear];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker View Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [yearArray count];
        case 1:
            return [monthArray count];
        default:
            return 0;
    }
}

#pragma mark - implement UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [yearArray objectAtIndex:row]; break;
        case 1:
            return [monthArray objectAtIndex:row];  break;
        default:
            return nil; break;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return 128.0f; break;
        case 1:
            return 192.0f;  break;
        default:
            return 0; break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
		case 0:
            selectedYear = [yearArray objectAtIndex:row];
            break;
		case 1:
            selectedMonth = [monthArray objectAtIndex:row];
            break;
	}
    [self setResultText];
}

@end
