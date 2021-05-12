//
//  ViewController.m
//  ImageViewer
//
//  Created by Olarn U. on 11/11/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;
@end

#define ZOOM_VIEW_TAG 100
#define ZOOM_STEP 1.5

@implementation ViewController

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center
{
    CGRect zoomRect;
    
    zoomRect.size.height = [self.imageScrollView frame].size.height / scale;
    zoomRect.size.width  = [self.imageScrollView frame].size.width  / scale;
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageScrollView.delegate = self;
    
    self.imageView.tag = ZOOM_VIEW_TAG;

    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(handleDoubleTap:)];
    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(handleTwoFingerTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [twoFingerTap setNumberOfTouchesRequired:2];
    
    [self.imageView addGestureRecognizer:doubleTap];
    [self.imageView addGestureRecognizer:twoFingerTap];
    
    float minimumScale = [self.imageScrollView frame].size.width / [self.imageView frame].size.width;
    [self.imageScrollView setMinimumZoomScale:minimumScale];
    [self.imageScrollView setZoomScale:minimumScale];
}

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer
{
    float newScale = [self.imageScrollView zoomScale] * ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale
                                  withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [self.imageScrollView zoomToRect:zoomRect animated:YES];
}


- (void)handleTwoFingerTap:(UIGestureRecognizer *)gestureRecognizer
{
    float newScale = [self.imageScrollView zoomScale] / ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale 					     withCenter:[gestureRecognizer 					locationInView:gestureRecognizer.view]];
    [self.imageScrollView zoomToRect:zoomRect animated:YES];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [scrollView viewWithTag:ZOOM_VIEW_TAG];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
