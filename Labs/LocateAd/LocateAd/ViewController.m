//
//  ViewController.m
//  LocateAd
//
//  Created by Olarn U. on 11/5/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)getPlaceFromServer
{
    NSURL * url = [NSURL URLWithString:@"http://localhost:8000/places.json"];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                              
                               if (connectionError) {
                                   return;
                               }
                               NSError * error;
                               NSDictionary * placeDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                          options:NSJSONReadingMutableLeaves
                                                                                            error:&error];
                               for (NSDictionary * eachPlace in [placeDict objectForKey:@"places"]) {
                                   CLLocationCoordinate2D coordinate;
                                   coordinate.latitude = [[eachPlace objectForKey:@"lat"] floatValue];
                                   coordinate.longitude = [[eachPlace objectForKey:@"long"] floatValue];

                                   LocationAnnotation * annotation = [[LocationAnnotation alloc] init];
                                   annotation.placeId = [eachPlace objectForKey:@"id"];
                                   annotation.coordinate = coordinate;
                                   annotation.title = [eachPlace objectForKey:@"name"];
                                   annotation.subtitle = [NSString stringWithFormat:@"%0.6f, %0.6f", coordinate.latitude, coordinate.longitude];
                                   
                                   [self.map addAnnotation:annotation];
                               }
                           }];
}

- (void)getPromotionAndAlert:(NSString *)placeId
{
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8000/promotions-%@.json", placeId]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               NSDictionary * promotion = [NSJSONSerialization JSONObjectWithData:data
                                                                                          options:NSJSONReadingMutableLeaves
                                                                                            error:nil];
                               [self.locationManager stopUpdatingLocation];
                               
                               /*
                               [[[UIAlertView alloc] initWithTitle:[promotion objectForKey:@"brand"]
                                                           message:[promotion objectForKey:@"description"]
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil, nil] show];
                               
                               */
                               [[UIApplication sharedApplication] cancelAllLocalNotifications];
                               UILocalNotification * noti = [[UILocalNotification alloc] init];
                               noti.fireDate = [NSDate date];
                               noti.alertBody = [promotion objectForKey:@"description"];
                               
                               noti.soundName = UILocalNotificationDefaultSoundName;
                               noti.alertAction = NSLocalizedString(@"View Details", nil);
                               
                               [[UIApplication sharedApplication] scheduleLocalNotification:noti];
                           }];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (self.interval == 5) { // ให้เช็คทุกๆ 5 วินาที
        self.interval = 0;
        
        NSArray *places = self.map.annotations;
        for (LocationAnnotation * eachPlace in places) {
            
            if ([eachPlace isKindOfClass:[MKUserLocation class]])
                continue;
            
            CLLocation *thisLocation = [[CLLocation alloc] initWithLatitude:eachPlace.coordinate.latitude
                                                                  longitude:eachPlace.coordinate.longitude];
            CLLocationDistance distance = [newLocation distanceFromLocation:thisLocation];
            
            NSLog(@"Place: %@, Distance: %f", eachPlace.title, distance);
            
            if (distance < 1000)
            {
                [self getPromotionAndAlert:eachPlace.placeId];
                return;
            }
        }
    }
    else
        self.interval++;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _alreadyShowPromotion = NO;
    _interval = 0;
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    
    self.places = [[NSMutableArray alloc] init];
    self.map.delegate = self;
    
    [self getPlaceFromServer];
    
    self.firstRouteIsRendered = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (annotation == self.map.userLocation) {
        CLLocationCoordinate2D userCoordinate = annotation.coordinate;
        mapView.userLocation.subtitle = [NSString stringWithFormat:@"%f, %f", userCoordinate.latitude, userCoordinate.longitude];
        return nil;
    }
    else {
        static NSString * annotationIdentifier = @"locationPin";

        MKPinAnnotationView * pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
        if (!pinView) {
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                      reuseIdentifier:annotationIdentifier];
            pinView.canShowCallout = YES;
            pinView.animatesDrop = YES;
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self action:@selector(btnCallOutTapped:) forControlEvents:UIControlEventTouchUpInside];
            pinView.rightCalloutAccessoryView = rightButton;
        }
        return pinView;
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    self.selectedAnnotation = view.annotation;
}

- (void)btnCallOutTapped:(id)sender
{
    [self.map removeOverlays: self.map.overlays];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    MKPlacemark * placemark = [[MKPlacemark alloc] initWithCoordinate:self.selectedAnnotation.coordinate addressDictionary:nil];
    MKMapItem * destination = [[MKMapItem alloc] initWithPlacemark:placemark];
    [destination setName:self.selectedAnnotation.title];
    
    request.destination = destination;
    request.requestsAlternateRoutes = YES;
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler: ^(MKDirectionsResponse *response, NSError *error) {
        
        for (MKRoute * route in response.routes) {
            [self.map addOverlay:route.polyline
                           level:MKOverlayLevelAboveRoads];
        }
    }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    if (self.firstRouteIsRendered) {
        renderer.strokeColor = [UIColor greenColor];
        renderer.lineWidth = 5.0;
        renderer.alpha = 0.4;
    } else {
        renderer.strokeColor = [UIColor blueColor];
        renderer.lineWidth = 5.0;
        renderer.alpha = 0.6;
    }
    
    if (!self.firstRouteIsRendered) {
        self.firstRouteIsRendered = YES;
    }
    return renderer;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueMapType"]) {
        SettingsViewController * settingViewController = [segue destinationViewController];
        int selectedIndex = -1;
        switch (self.map.mapType) {
            case MKMapTypeStandard:
                selectedIndex = 0;
                break;
            case MKMapTypeHybrid:
                selectedIndex = 1;
                break;
            case MKMapTypeSatellite:
                selectedIndex = 2;
                break;
            default:
                break;
        }
        settingViewController.mapTypeIndex = selectedIndex;
        settingViewController.delegate = self;
    }
}

- (IBAction)btnActionTapped:(id)sender
{
    UIActionSheet * actionsheet = [[UIActionSheet alloc] initWithTitle:@"Locate Place"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:nil
                                                     otherButtonTitles:@"Reload All Places", @"Nearest Place", nil];
    actionsheet.delegate = self;
    [actionsheet showInView:self.map];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.map.userTrackingMode = MKUserTrackingModeNone;
    
    switch (buttonIndex) {
        case 0:
            [self.map removeAnnotations:self.map.annotations];
            [self getPlaceFromServer];
            break;
        case 1:
        {
            CLLocationCoordinate2D userCoordinate = self.map.userLocation.coordinate;
            CLLocation *userLocation = [[CLLocation alloc]            initWithLatitude:userCoordinate.latitude                   longitude:userCoordinate.longitude];
            
            NSArray *places = self.map.annotations;
            
            CLLocationDistance nearestDistance = 10000000000;
            LocationAnnotation * nearestPlace = [places objectAtIndex:0];

            for (LocationAnnotation * eachPlace in places) {
                
                if ([eachPlace isKindOfClass:[MKUserLocation class]])
                    continue;
                
                if (userCoordinate.latitude == eachPlace.coordinate.latitude && userCoordinate.longitude == eachPlace.coordinate.longitude)
                    break;
                
                CLLocation *thisLocation = [[CLLocation alloc] initWithLatitude:eachPlace.coordinate.latitude
                                                                      longitude:eachPlace.coordinate.longitude];
                CLLocationDistance distanceFromUserLocationToThisStore = [userLocation distanceFromLocation:thisLocation];
                
                if (distanceFromUserLocationToThisStore < nearestDistance) {
                    nearestDistance = distanceFromUserLocationToThisStore;
                    nearestPlace = eachPlace;
                }
            }
            
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userCoordinate, 2 * nearestDistance, 2 * nearestDistance);
            [self.map selectAnnotation:nearestPlace animated:YES];
            
            @try {
                [self.map setRegion:region animated:YES];
            }
            @catch (NSException *exception) {
            }
            
            break;
        }
        default:
            break;
    }
}

- (IBAction)btnSelfLocationTapped:(id)sender
{
    if (self.map.userTrackingMode == MKUserTrackingModeNone)
        self.map.userTrackingMode = MKUserTrackingModeFollow;
    else
        if (self.map.userTrackingMode == MKUserTrackingModeFollow)
            self.map.userTrackingMode = MKUserTrackingModeFollowWithHeading;
        else
            if (self.map.userTrackingMode == MKUserTrackingModeFollowWithHeading)
                self.map.userTrackingMode = MKUserTrackingModeNone;
}

- (void)didSelectMapType:(MKMapType)mapType
{
    self.map.mapType = mapType;
}

@end
