//
//  ViewController.m
//  Surface
//
//  Created by Olarn U. on 11/11/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self addGestureRecognizerToImageView:self.imageView1];
	[self addGestureRecognizerToImageView:self.imageView2];
	[self addGestureRecognizerToImageView:self.imageView3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addGestureRecognizerToImageView:(UIView *) imageView
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImageView:)];
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleImageView:)];
    [pinchGesture  setDelegate:self];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panImageView:)];
    [panGesture setMaximumNumberOfTouches:2];
    [panGesture  setDelegate:self];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showResetMenu:)];

	[imageView addGestureRecognizer:tapGesture];
    [imageView addGestureRecognizer:rotationGesture];
    [imageView addGestureRecognizer:pinchGesture];
    [imageView addGestureRecognizer:panGesture];
    [imageView addGestureRecognizer:longPressGesture];
}

- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{/*
    if ( gestureRecognizer.state == UIGestureRecognizerStateBegan ) {
        UIView *itsView = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:itsView];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:itsView.superview];
        itsView.layer.anchorPoint = CGPointMake(locationInView.x / itsView.bounds.size.width,
                                                locationInView.y / itsView.bounds.size.height);
        itsView.center = locationInSuperview;
        
        NSLog(@"x = %f, y = %f", locationInView.x, locationInView.y);
    }
  */
}

- (void)showResetMenu:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if  ([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        UIMenuItem *resetMenuItem = [[UIMenuItem alloc] initWithTitle:@"Reset" action:@selector(resetImageView:)];
        CGPoint location = [gestureRecognizer locationInView:[gestureRecognizer view]];
        
        [self becomeFirstResponder];
        [menuController setMenuItems:[NSArray arrayWithObject:resetMenuItem]];
        [menuController setTargetRect:CGRectMake(location.x, location.y, 0, 0)
                               inView:[gestureRecognizer view]];
        [menuController setMenuVisible:YES animated:YES];
        
        self.imageForReset = [gestureRecognizer view];
    }
}

- (void)resetImageView:(UIMenuController *)controller
{
    CGPoint locationInSuperview =
    [self.imageForReset convertPoint:CGPointMake(CGRectGetMidX(self.imageForReset.bounds),
                                                 CGRectGetMidY(self.imageForReset.bounds))
                              toView:[self.imageForReset superview]];
    
    [[self.imageForReset layer] setAnchorPoint:CGPointMake(0.5, 0.5)];
    [self.imageForReset setCenter:locationInSuperview];
    
    [UIView beginAnimations:nil context:nil];
    [self.imageForReset setTransform:CGAffineTransformIdentity];
    [UIView commitAnimations];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)tapImageView:(UITapGestureRecognizer *)gestureRecognizer
{
	UIView *imageView = [gestureRecognizer view];
	[self.view bringSubviewToFront:imageView];
}

- (void)panImageView:(UIPanGestureRecognizer *)gestureRecognizer
{
    UIView *imageView = [gestureRecognizer view];
	[self.view bringSubviewToFront:imageView];
	
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan ||         [gestureRecognizer state] == UIGestureRecognizerStateChanged)
    {
        CGPoint translation =
        [gestureRecognizer translationInView:[imageView superview]];
        
        [imageView setCenter:CGPointMake([imageView center].x + translation.x,
                                         [imageView center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[imageView superview]];
    }
}

- (void)rotateImageView:(UIRotationGestureRecognizer *)gestureRecognizer
{
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || 	   [gestureRecognizer state] == UIGestureRecognizerStateChanged)
    {
        [gestureRecognizer view].transform =
        CGAffineTransformRotate([[gestureRecognizer view] transform],
                                [gestureRecognizer rotation]);
        [gestureRecognizer setRotation:0];
    }
}

- (void)scaleImageView:(UIPinchGestureRecognizer *)gestureRecognizer
{
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan ||
        [gestureRecognizer state] == UIGestureRecognizerStateChanged)
    {
        [gestureRecognizer view].transform =
        CGAffineTransformScale([[gestureRecognizer view] transform], [gestureRecognizer scale],
                               [gestureRecognizer scale]);
        [gestureRecognizer setScale:1];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	if (gestureRecognizer.view != self.imageView1 &&
        gestureRecognizer.view != self.imageView2 &&
        gestureRecognizer.view != self.imageView3)
	{
        return NO;
    }
    
    if (gestureRecognizer.view != otherGestureRecognizer.view)
        return NO;
    
	if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]] ||
        [otherGestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]])
	{
        return NO;
    }
    return YES;
}

@end
