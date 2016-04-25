//
//  MBPopMenu.m
//  MicroBlog
//
//  Created by qianfeng on 15-8-4.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "MBPopMenu.h"

@interface MBPopMenu()

/**
 *  最底部的遮盖，屏蔽其他控件事件
 */
@property (nonatomic, weak) UIButton * cover;

/**
 *  容器，用来装contentView
 */
@property (nonatomic, weak) UIImageView * container;

/**
 *  具体要显示的内容
 */
@property (nonatomic, strong) UIView * contentView;

@end

@implementation MBPopMenu

- (instancetype)initWithContentView:(UIView *)contentView{
    if (self = [super init]) {
        self.contentView = contentView;
    }
    return self;
}

+ (instancetype)popMenuWithContentView:(UIView * )contentView{
    return [[self alloc] initWithContentView:contentView];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton * cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(coverAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        UIImageView * container = [[UIImageView alloc] init];
        container.userInteractionEnabled = YES;
        [self addSubview:container];
        self.container = container;
    }
    return self;
}

/**
 *  当点击container其他区域使 popMenu消失。
 */
- (void)coverAction{
//    MBLog(@"coverAction");
    if ([self.delegate respondsToSelector:@selector(popMenuDidDismissed:)]) {
        [self.delegate popMenuDidDismissed:self];
    }
    
    [self removeFromSuperview];
}

- (void)layoutSubviews{
    [super layoutSubviews];//?????????
    self.cover.frame = self.bounds;
}

- (void)showInRect:(CGRect)rect{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    self.container.frame = rect;
    
    // 设置容器里面内容的frame
    CGFloat topMargin = 12;
    CGFloat leftMargin = 5;
    CGFloat rightMargin = 5;
    CGFloat bottomMargin = 8;
    
    self.contentView.x = leftMargin;
    self.contentView.y = topMargin;
    self.contentView.width = self.container.width - leftMargin - rightMargin;
    self.contentView.height = self.container.height - topMargin - bottomMargin;
    
    [self.container addSubview:self.contentView];
}

- (void)setArrowPosition:(MBPopMenuArrowPosition)arrowPosition{
    _arrowPosition = arrowPosition;
    
    switch (arrowPosition) {
        case MBPopMenuArrowPositionCenter:
            self.container.image = [UIImage resizedImageWithName:@"popover_background"];
            break;
            
        case MBPopMenuArrowPositionLeft:
            self.container.image = [UIImage resizedImageWithName:@"popover_background_left"];
            break;
            
        case MBPopMenuArrowPositionRight:
            self.container.image = [UIImage resizedImageWithName:@"popover_background_right"];
            break;
        default:
            break;
    }
}

- (void)setDimBackground:(BOOL)dimBackground{
    _dimBackground = dimBackground;
    
    if (dimBackground) {
        self.cover.backgroundColor = [UIColor blackColor];
        self.cover.alpha = 0.3;
    }
    else{
        self.cover.backgroundColor = [UIColor clearColor];
        self.cover.alpha = 1.0;
    }
}

@end
