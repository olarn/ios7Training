//
//  ViewController.h
//  BasicTouch
//
//  Created by Olarn U. on 11/11/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UITouch * trackedTouch;
@property (nonatomic) CGPoint startPoint;

@end
