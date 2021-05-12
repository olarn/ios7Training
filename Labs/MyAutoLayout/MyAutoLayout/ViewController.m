//
//  ViewController.m
//  MyAutoLayout
//
//  Created by Olarn U. on 11/12/2556 BE.
//  Copyright (c) 2556 Olarn U. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray * array = @[@"one", @"two"];
    
    for (NSString * s in array) {
        NSLog(@"value = %@", s);
    }
    
    NSDictionary * dictionary = @{@"1": @"one",
                                  @"2": @"two"};
    
    NSString * tmp = dictionary[@1];
    
    [dictionary setValue:@"" forKey:@"1"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
