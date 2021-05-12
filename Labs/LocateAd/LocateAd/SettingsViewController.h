//
//  SettingsViewController.h
//  LocateAd
//
//  Created by Olarn U. on 11/5/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@protocol SettingsViewControllerDelegate <NSObject>
- (void)didSelectMapType:(MKMapType)mapType;
@end

@interface SettingsViewController : UIViewController

@property (nonatomic, assign) id<SettingsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentMapType;
@property (nonatomic) int mapTypeIndex;

- (IBAction)segMapTypeChanged:(id)sender;

@end
