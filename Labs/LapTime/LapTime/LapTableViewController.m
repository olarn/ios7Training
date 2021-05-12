//
//  LapTableViewController.m
//  LapTime
//
//  Created by Olarn U. on 6/16/2557 BE.
//  Copyright (c) 2557 G-ABLE Co., Ltd. All rights reserved.
//

#import "LapTableViewController.h"

@interface LapTableViewController ()

@end

@implementation LapTableViewController

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.race.laps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"lapCell";  // ตามที่กำหนดไว้ในข้อ 14.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    // Sort Lap objects
    NSArray *laps = [self.race.laps allObjects];
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"timeStamp" 											   ascending:NO];
    NSArray* sortedArray = [laps sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    Lap * lap = [sortedArray objectAtIndex:indexPath.row];
    
    // Time to string
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm:ss";
    cell.textLabel.text = [dateFormatter stringFromDate:lap.timeStamp];
    
    // compare time
    Lap *previousLap = nil;
    if ([sortedArray count] > (indexPath.row + 1))
		previousLap = [sortedArray objectAtIndex:(indexPath.row + 1)];
    
    if (previousLap) {
		NSTimeInterval timeDifferent = [[lap timeStamp] timeIntervalSinceDate:[previousLap timeStamp]];
		cell.textLabel.text = [cell.textLabel.text stringByAppendingString:                                      [NSString stringWithFormat:@"  +%.02f sec", timeDifferent]];
    }
    
    return cell;
}


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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnPauseTapped:(id)sender
{
    Lap * newLap = [ContextHelper insertNewObjectForEntityForName:@"Lap"];
    newLap.timeStamp = [NSDate date];
    newLap.race = self.race;
    [self.race addLapsObject:newLap];
    
    [ContextHelper saveContext];
    
    [self.tableView reloadData];
}
@end
