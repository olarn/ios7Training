//
//  ContactTableViewController.h
//  iContact
//
//  Created by Olarn U. on 11/1/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerDetailViewController.h"
#import "Customer.h"

@interface ContactTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray * customers;

@end
