//
//  LapTableViewController.h
//  LapTime
//
//  Created by Olarn U. on 6/16/2557 BE.
//  Copyright (c) 2557 G-ABLE Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContextHelper.h"
#import "Race.h"
#import "Lap.h"

@interface LapTableViewController : UITableViewController

@property (nonatomic, strong)Race * race;

- (IBAction)btnPauseTapped:(id)sender;

@end
