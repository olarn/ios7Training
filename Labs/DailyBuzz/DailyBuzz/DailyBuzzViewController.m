//
//  DailyBuzzViewController.m
//  DailyBuzz
//
//  Created by Olarn U. on 10/30/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "DailyBuzzViewController.h"

@interface DailyBuzzViewController ()

@end

@implementation DailyBuzzViewController

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
    
    self.coffees = [[NSMutableArray alloc] init];
    
    Coffee * coffee = [[Coffee alloc] init];
    coffee.coffeeName = @"Espresso";
    coffee.temperature = 95.0;
    coffee.date = [NSDate date];
    [self.coffees addObject:coffee];
    
    coffee = [[Coffee alloc] init];
    coffee.coffeeName = @"Capputino";
    coffee.temperature = 98.0;
    coffee.date = [NSDate date];
    [self.coffees addObject:coffee];
    
    coffee = [[Coffee alloc] init];
    coffee.coffeeName = @"Latte";
    coffee.temperature = 92.0;
    coffee.date = [NSDate date];
    [self.coffees addObject:coffee];
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
    return [self.coffees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DailyBuzzCell";
    DailyBuzzCellController *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[DailyBuzzCellController alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:CellIdentifier];
    }
    
    double t = [[self.coffees objectAtIndex:indexPath.row] temperature];
    NSString * stringDate = [NSString stringWithFormat:@"%@", [[self.coffees objectAtIndex:indexPath.row] date]];
    
    cell.txtCoffeeName.text = [[self.coffees objectAtIndex:indexPath.row] coffeeName];
    cell.txtTemperature.text = [NSString stringWithFormat:@"%1.0f C", t];
    cell.txtDate.text = stringDate;
    
    return cell;
}

- (void)didBtnSaveTap:(Coffee *)newCoffee
{
    [self.coffees addObject:newCoffee];
    [self.tableView reloadData];
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueBrewDetail"]) {
        BrewDetailViewController * brewDetail = (BrewDetailViewController *)[segue destinationViewController];
        NSIndexPath * indexPath = self.tableView.indexPathForSelectedRow;
        brewDetail.coffee = [self.coffees objectAtIndex:indexPath.row];
    } else
        if ([segue.identifier isEqualToString:@"segueNewCoffee"]) {
            BrewDetailViewController * brewDetail = (BrewDetailViewController *)[segue destinationViewController];
            brewDetail.delegate = self;
        }
}


@end
