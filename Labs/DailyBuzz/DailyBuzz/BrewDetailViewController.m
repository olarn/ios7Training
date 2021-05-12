//
//  BrewDetailViewController.m
//  DailyBuzz
//
//  Created by Olarn U. on 10/30/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "BrewDetailViewController.h"

@interface BrewDetailViewController ()

@end

@implementation BrewDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.coffee) {
        self.txtCoffeeName.text = self.coffee.coffeeName;
        self.txtTemperature.text = [NSString stringWithFormat:@"%1.0f C", self.coffee.temperature];
        self.txtDate.text = [NSString stringWithFormat:@"%@", self.coffee.date];
    }
}

#pragma mark - Table view data source

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (IBAction)btnSaveTapped:(id)sender
{
    if ([self.txtCoffeeName.text isEqualToString:@""] ||
        [self.txtTemperature.text isEqualToString:@""]) {
        
        [[[UIAlertView alloc] initWithTitle:@"Require Fields..."
                                   message:@"Require Coffee name and Temperature"
                                  delegate:nil
                         cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil] show];
        return;
    }
    
    if (self.delegate) {
        Coffee * newCoffee = [[Coffee alloc] init];
        newCoffee.coffeeName = self.txtCoffeeName.text;
        newCoffee.temperature = [self.txtTemperature.text doubleValue];
        newCoffee.date = [NSDate date];
        [self.delegate didBtnSaveTap:newCoffee];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
