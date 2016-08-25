//
//  ViewController.m
//  sizeClass
//
//  Created by ruiwang on 16/8/24.
//  Copyright © 2016年 ruiwang. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController () {
    CALayer *_layer;
}

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end

@implementation ViewController
- (IBAction)back:(id)sender {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {

        objc_msgSend([UIDevice currentDevice], @selector(setOrientation:), UIInterfaceOrientationPortrait);
    }
}
- (IBAction)fullScreen:(id)sender {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {

        objc_msgSend([UIDevice currentDevice], @selector(setOrientation:), UIInterfaceOrientationLandscapeLeft);
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _layer = [[CALayer alloc] init];
    _layer.backgroundColor = [[UIColor redColor] CGColor];
    [self.contentView.layer addSublayer:_layer];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    _layer.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
