//
//  BrewDetailViewController.h
//  DailyBuzz
//
//  Created by Olarn U. on 10/30/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coffee.h"

@protocol BrewDetailViewControllerDelegate <NSObject>
- (void)didBtnSaveTap:(Coffee *)newCoffee;
@end

@interface BrewDetailViewController : UITableViewController

@property (nonatomic, assign) id<BrewDetailViewControllerDelegate> delegate;

@property (nonatomic, weak) Coffee * coffee;
@property (weak, nonatomic) IBOutlet UITextField *txtCoffeeName;
@property (weak, nonatomic) IBOutlet UITextField *txtTemperature;
@property (weak, nonatomic) IBOutlet UITextField *txtDate;

- (IBAction)btnSaveTapped:(id)sender;

@end
