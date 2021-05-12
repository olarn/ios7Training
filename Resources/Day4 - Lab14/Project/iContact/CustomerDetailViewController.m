//
//  CustomerDetailViewController.m
//  iContact
//
//  Created by Olarn U. on 11/1/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "CustomerDetailViewController.h"

@interface CustomerDetailViewController ()

@end

@implementation CustomerDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.customer) {
        self.txtName.text = [NSString stringWithFormat:@"Name : %@ %@", self.customer.firstName, self.customer.lastName];
        self.txtCompany.text = [NSString stringWithFormat:@"Company : %@", self.customer.company];
        if (self.customer.image) {
            self.imgCustomer.image = self.customer.image;
        }
        // add code here ...
    }
}

// add code here ...

@end
