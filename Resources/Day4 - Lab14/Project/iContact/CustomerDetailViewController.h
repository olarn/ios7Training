//
//  CustomerDetailViewController.h
//  iContact
//
//  Created by Olarn U. on 11/1/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"

@interface CustomerDetailViewController : UIViewController 

@property (weak, nonatomic) Customer * customer;

// add code here ...

@property (weak, nonatomic) IBOutlet UIImageView *imgCustomer;
@property (weak, nonatomic) IBOutlet UILabel *txtName;
@property (weak, nonatomic) IBOutlet UILabel *txtCompany;

@end
