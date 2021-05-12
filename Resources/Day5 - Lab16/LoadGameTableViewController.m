//
//  LoadGameTableViewController.m
//  AutoLayoutGame
//
//  Created by Olarn U. on 11/14/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "LoadGameTableViewController.h"

@interface LoadGameTableViewController ()

@end

@implementation LoadGameTableViewController

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
    
    self.saveGames = [[NSMutableArray alloc] init];

    SaveGame * save = [[SaveGame alloc] init];
    save.saveDate = [[NSDate date] dateByAddingTimeInterval:10000];
    save.saveDetail = @"South gate of Geffen City";
    [self.saveGames addObject:save];
    
    save = [[SaveGame alloc] init];
    save.saveDate = [[NSDate date] dateByAddingTimeInterval:900];
    save.saveDetail = @"Green field 2 blocks from east gate of Payon town";
    [self.saveGames addObject:save];

    save = [[SaveGame alloc] init];
    save.saveDate = [NSDate date];
    save.saveDetail = @"3rd floor of Zombie Dungeon";
    [self.saveGames addObject:save];
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
    return [self.saveGames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    LoadGameCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[LoadGameCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:CellIdentifier];
    }
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    cell.txtDate.text = [dateFormatter stringFromDate:[[self.saveGames objectAtIndex:indexPath.row] saveDate]];
    cell.txtSaveDetail.text = [[self.saveGames objectAtIndex:indexPath.row] saveDetail];
    
    return cell;
}

@end
