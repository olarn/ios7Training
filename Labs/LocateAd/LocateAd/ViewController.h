//
//  ViewController.h
//  LocateAd
//
//  Created by Olarn U. on 11/5/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
#import "LocationAnnotation.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <SettingsViewControllerDelegate, MKMapViewDelegate, UIActionSheetDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager * locationManager;

@property (nonatomic, strong) NSMutableArray * places;
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (nonatomic, weak) LocationAnnotation * selectedAnnotation;
@property (nonatomic) bool firstRouteIsRendered;
@property (nonatomic) int interval;
@property (nonatomic) bool alreadyShowPromotion;

- (IBAction)btnActionTapped:(id)sender;
- (IBAction)btnSelfLocationTapped:(id)sender;

- (void)getPlaceFromServer;

@end
