//
//  DailyBuzzCellController.h
//  DailyBuzz
//
//  Created by Olarn U. on 10/30/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyBuzzCellController : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *txtCoffeeName;
@property (weak, nonatomic) IBOutlet UILabel *txtTemperature;
@property (weak, nonatomic) IBOutlet UILabel *txtDate;

@end
