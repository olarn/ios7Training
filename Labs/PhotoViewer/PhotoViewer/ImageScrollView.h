//
//  ImageScrollView.h
//  PhotoViewer
//
//  Created by Olarn U. on 11/13/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScrollView : UIScrollView

@property (nonatomic, strong) UIImageView * imageView;

- (void)configureImageViewFor:(int)imageIndex;

@end
