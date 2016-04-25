//
//  ViewController.m
//  CustomToolBar
//
//  Created by qianfeng on 15-8-11.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "ViewController.h"
#import "MBTextView.h"
#import "MBComposeToolbar.h"
#import "UIView+Extension.h"

@interface ViewController () <MBComposeToolbarDelegate, UITextViewDelegate>

@property (nonatomic, weak) MBTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加输入控件
    [self setupTextView];
    
    // 添加工具条
    [self setupToolbar];
}

// 添加工具条
- (void)setupToolbar
{
    // 1.创建
    MBComposeToolbar *toolbar = [[MBComposeToolbar alloc] init];
    toolbar.width = self.view.width;
    toolbar.delegate = self;
    toolbar.height = 44;
    
    // 2.显示
    self.textView.inputAccessoryView = toolbar;
}

// 添加输入控件
- (void)setupTextView
{
    // 1.创建输入控件
    MBTextView *textView = [[MBTextView alloc] init];
    textView.alwaysBounceVertical = YES; // 垂直方向上拥有有弹簧效果
    textView.frame = self.view.bounds;
    textView.delegate = self;
    [self.view addSubview:textView];
    self.textView = textView;
    
    // 2.设置提醒文字（占位文字）
    textView.placehoder = @"分享新鲜事...";
    
    // 3.设置字体
    textView.font = [UIFont systemFontOfSize:15];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
