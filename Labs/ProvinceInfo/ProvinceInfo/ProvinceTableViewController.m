//
//  ProvinceTableViewController.m
//  ProvinceInfo
//
//  Created by Olarn U. on 10/16/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ProvinceTableViewController.h"
#import "ProvinceCell.h"

@interface ProvinceTableViewController ()

@end

@implementation ProvinceTableViewController

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
    
    self.selectedProvinces = [[NSMutableArray alloc] init];
    
    self.centralRegion = [[NSMutableArray alloc] initWithObjects:@"กรุงเทพฯ", @"สระบุรี", @"สมุทรสาคร", @"สมุทรสงคราม", nil];
    self.northern = [[NSMutableArray alloc] initWithObjects:@"เชียงใหม่", @"เชียงราย", @"แม่ฮ่องสอน", @"ลำพูน", @"ลำปาง", nil];
    self.northEastern = [[NSMutableArray alloc] initWithObjects:@"อุดรธานี", @"อุบลราชธานี", @"ขอนแก่น", @"ร้อยเอ็ด", @"นครราชสีมา", nil];
    self.southern = [[NSMutableArray alloc] initWithObjects:@"พังงา", @"ภูเก็ต", @"ชุมพร", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    self.centralRegion = nil;
    self.northern = nil;
    self.northEastern = nil;
    self.southern = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger total;
    switch (section) {
        case 0:  total = [self.centralRegion count];    break;
        case 1:  total = [self.northern count];         break;
        case 2:  total = [self.northEastern count];     break;
        case 3:  total = [self.southern count];         break;
        default: total = 0;                             break;
    }
    return total;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"ภาคกลาง";
            break;
        case 1:
            return @"ภาคเหนือ";
            break;
        case 2:
            return @"ภาคอีสาน";
            break;
        case 3:
            return @"ภาคใต้";
            break;
        default:
            return @"";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ProvinceCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[ProvinceCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.imgViewRegion.image = [UIImage imageNamed:@"CentralRegion"];
            cell.txtProvinceName.text = [self.centralRegion objectAtIndex:indexPath.row];  break;
        case 1:
            cell.imgViewRegion.image = [UIImage imageNamed:@"Northern"];
            cell.txtProvinceName.text = [self.northern objectAtIndex:indexPath.row];       break;
        case 2:
            cell.imgViewRegion.image = [UIImage imageNamed:@"NorthEastern"];
            cell.txtProvinceName.text = [self.northEastern objectAtIndex:indexPath.row];   break;
        case 3:
            cell.imgViewRegion.image = [UIImage imageNamed:@"Southern"];
            cell.txtProvinceName.text = [self.southern objectAtIndex:indexPath.row];       break;
        default: break;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * selectedProvince;
    
    switch (indexPath.section) {
        case 0:
            selectedProvince = [self.centralRegion objectAtIndex:indexPath.row]; break;
        case 1:
            selectedProvince = [self.northern objectAtIndex:indexPath.row];      break;
        case 2:
            selectedProvince = [self.northEastern objectAtIndex:indexPath.row];  break;
        case 3:
            selectedProvince = [self.southern objectAtIndex:indexPath.row];      break;
        default: break;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.selectedProvinces removeObject:selectedProvince];
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.selectedProvinces addObject:selectedProvince];
    }
    
    // selectedProvince = [NSString stringWithFormat:@"คุณเลือก %@", selectedProvince];
    
    /*
    [[[UIAlertView alloc] initWithTitle:nil
                               message:selectedProvince
                              delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil, nil] show];
     */
}

- (UITableViewCellEditingStyle) tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath {
    return UITableViewCellEditingStyleDelete;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        switch (indexPath.section) {
            case 0:
                [self.centralRegion removeObjectAtIndex:indexPath.row];
                break;
            case 1:
                [self.northern removeObjectAtIndex:indexPath.row];
                break;
            case 2:
                [self.northEastern removeObjectAtIndex:indexPath.row];
                break;
            case 3:
                [self.southern removeObjectAtIndex:indexPath.row];
                break;
            default: break;
        }

        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {

    }
}


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

- (IBAction)btnBookmarkTapped:(id)sender
{
    if ([self.selectedProvinces count] == 0)
        return;
    
    NSString * msg = [NSString stringWithFormat:@"คุณเลือก %@", [self.selectedProvinces componentsJoinedByString:@", "]];
    
    [[[UIAlertView alloc] initWithTitle:@"จังหวัดที่เลือกไว้"
                                message:msg
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];

}

@end
