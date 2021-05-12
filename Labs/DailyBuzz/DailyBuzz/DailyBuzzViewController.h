//
//  DailyBuzzViewController.h
//  DailyBuzz
//
//  Created by Olarn U. on 10/30/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coffee.h"
#import "DailyBuzzCellController.h"
#import "BrewDetailViewController.h"

@interface DailyBuzzViewController : UITableViewController <BrewDetailViewControllerDelegate>

@property (nonatomic, strong)NSMutableArray * coffees;

@end
