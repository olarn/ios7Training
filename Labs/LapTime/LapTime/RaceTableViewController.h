//
//  RaceTableViewController.h
//  LapTime
//
//  Created by Olarn U. on 6/16/2557 BE.
//  Copyright (c) 2557 G-ABLE Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RaceTableViewController : UITableViewController

@property (nonatomic, strong)NSMutableArray * races;

- (IBAction)btnAddTapped:(id)sender;
- (IBAction)btnDeleteTapped:(id)sender;

@end
