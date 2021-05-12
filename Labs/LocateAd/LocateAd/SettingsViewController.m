//
//  SettingsViewController.m
//  LocateAd
//
//  Created by Olarn U. on 11/5/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.segmentMapType.selectedSegmentIndex = self.mapTypeIndex;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segMapTypeChanged:(id)sender
{
    if (self.delegate) {
        switch ([sender selectedSegmentIndex]) {
            case 0:
                [self.delegate didSelectMapType:MKMapTypeStandard];
                break;
            case 1:
                [self.delegate didSelectMapType:MKMapTypeHybrid];
                break;
            case 2:
                [self.delegate didSelectMapType:MKMapTypeSatellite];
                break;
                
            default:
                break;
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
