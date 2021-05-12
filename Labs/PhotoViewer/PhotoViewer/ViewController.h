//
//  ViewController.h
//  PhotoViewer
//
//  Created by Olarn U. on 11/13/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScrollView.h"

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView * pagingScrollView;

@end
