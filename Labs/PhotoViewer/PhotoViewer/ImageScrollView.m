//
//  ImageScrollView.m
//  PhotoViewer
//
//  Created by Olarn U. on 11/13/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)configureImageViewFor:(int)imageIndex
{
    if (!self.imageView) {
        CGRect imageViewFrame = self.bounds;
        
        self.imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
        self.imageView.tag = 100;
        
        NSString *imageName = [NSString stringWithFormat:@"frog%i.png", imageIndex];
        self.imageView.image = [UIImage imageNamed:imageName];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        self.contentSize = imageViewFrame.size;
        float minimumScale = [self frame].size.width / [self.imageView frame].size.width;
        [self setMinimumZoomScale:minimumScale];
        [self setMaximumZoomScale:minimumScale * 3];
        
        [self addSubview:self.imageView];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
