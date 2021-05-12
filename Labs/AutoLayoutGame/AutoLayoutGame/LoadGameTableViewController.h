//
//  LoadGameTableViewController.h
//  AutoLayoutGame
//
//  Created by Olarn U. on 11/14/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveGame.h"
#import "LoadGameCell.h"

@interface LoadGameTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray * saveGames;

@end
