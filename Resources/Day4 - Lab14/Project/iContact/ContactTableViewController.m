//
//  ContactTableViewController.m
//  iContact
//
//  Created by Olarn U. on 11/1/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ContactTableViewController.h"

@interface ContactTableViewController ()

@end

@implementation ContactTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.customers = [[NSMutableArray alloc] init];
    
    // add code here ...
}

// add code here ...

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.customers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    Customer * c = [self.customers objectAtIndex:indexPath.row];
    NSString * customerName = [NSString stringWithFormat:@"%@ %@", c.firstName, c.lastName];
    cell.textLabel.text = customerName;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"sugueCustomerDetail"]) {
        CustomerDetailViewController * detailView = (CustomerDetailViewController *)[segue destinationViewController];
        
        NSIndexPath * indexPath = self.tableView.indexPathForSelectedRow;
        detailView.customer = [self.customers objectAtIndex:indexPath.row];
    }
}

@end
