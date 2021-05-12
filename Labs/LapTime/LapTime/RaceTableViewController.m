//
//  RaceTableViewController.m
//  LapTime
//
//  Created by Olarn U. on 6/16/2557 BE.
//  Copyright (c) 2557 G-ABLE Co., Ltd. All rights reserved.
//

#import "RaceTableViewController.h"
#import "ContextHelper.h"
#import "Race.h"
#import "LapTableViewController.h"


@interface RaceTableViewController ()

@end

@implementation RaceTableViewController

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
    
    self.races = [ContextHelper getAllObjectsFromEntity:@"Race"
                                            initWithKey:@"raceName"
                                              ascending:YES];
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
    return [self.races count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RaceCell";
    UITableViewCell *cell =           [tableView dequeueReusableCellWithIdentifier:CellIdentifier                                           forIndexPath:indexPath];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/mm/yyyy HH.mm.ss"];
    
    Race * race = [self.races objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@  [%@]",
                           race.raceName,
                           [dateFormatter stringFromDate:race.raceDate]];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueLap"]) {
        LapTableViewController * lapTableViewController =             [segue destinationViewController];
        
        long row = self.tableView.indexPathForSelectedRow.row;
        lapTableViewController.race = [self.races objectAtIndex:row];
        
        [lapTableViewController.tableView reloadData];
    }
}


- (IBAction)btnAddTapped:(id)sender
{
    Race *race = [ContextHelper insertNewObjectForEntityForName:@"Race"];
    race.raceName = [NSString stringWithFormat:@"Race - %lu", (unsigned long)[self.races count]];
    race.raceDate = [NSDate date];
	
    [ContextHelper saveContext];
    
	self.races = [ContextHelper getAllObjectsFromEntity:@"Race"                                              initWithKey:@"raceDate"
                                              ascending:NO];
	[self.tableView reloadData];
}

- (IBAction)btnDeleteTapped:(id)sender
{
    for (Race *r in self.races) {
        [ContextHelper deleteObjectFromContext:r];
    }
    [ContextHelper saveContext];
    
    [self.races removeAllObjects];
	self.races = [ContextHelper getAllObjectsFromEntity:@"Race" initWithKey:@"raceDate" ascending:NO];
	[self.tableView reloadData];
}
@end
