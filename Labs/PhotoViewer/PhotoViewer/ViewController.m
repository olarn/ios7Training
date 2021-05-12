//
//  ViewController.m
//  PhotoViewer
//
//  Created by Olarn U. on 11/13/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    
    // กำหนด scroll view เพื่อให้สามารถ scroll ได้
    CGRect pagingScrollViewFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.pagingScrollView = [[ImageScrollView alloc] initWithFrame:pagingScrollViewFrame];
    self.pagingScrollView.pagingEnabled = YES;
    self.pagingScrollView.backgroundColor = [UIColor blackColor];
    
    // กำหนด content size ของ scroll
    self.pagingScrollView.contentSize = CGSizeMake(pagingScrollViewFrame.size.width * 3,
                                                   pagingScrollViewFrame.size.height);
    self.view = self.pagingScrollView;
    
    // เพิ่ม scroll view สำหรับแสดงรูปและ zoom รูปลงใน paging scroll view
    for (int i = 0; i < 3; i++) {
        CGRect pageFrame = CGRectMake(self.view.frame.size.width * i + 5, 0, self.view.frame.size.width - 10, self.view.frame.size.height);
        
        ImageScrollView *page = [[ImageScrollView alloc] initWithFrame:pageFrame];
        page.delegate = self;
        page.backgroundColor = [UIColor blackColor];
        [page configureImageViewFor:i];
        [self.pagingScrollView addSubview:page];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [scrollView viewWithTag:100];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
