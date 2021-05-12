//
//  LocationAnnotation.h
//  LocateAd
//
//  Created by Olarn U. on 11/7/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LocationAnnotation : NSObject <MKAnnotation>

@property (nonatomic, strong) NSString * placeId;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;
@property(nonatomic) CLLocationCoordinate2D coordinate;

@end
