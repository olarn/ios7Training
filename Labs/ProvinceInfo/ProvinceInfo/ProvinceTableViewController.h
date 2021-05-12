//
//  ProvinceTableViewController.h
//  ProvinceInfo
//
//  Created by Olarn U. on 10/16/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProvinceTableViewController : UITableViewController

@property (strong, nonatomic)NSMutableArray * northern;
@property (strong, nonatomic)NSMutableArray * southern;
@property (strong, nonatomic)NSMutableArray * northEastern;
@property (strong, nonatomic)NSMutableArray * centralRegion;

@property (strong, nonatomic)NSMutableArray * selectedProvinces;

- (IBAction)btnBookmarkTapped:(id)sender;

@end
