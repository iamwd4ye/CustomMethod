//
//  MBPopMenu.h
//  MicroBlog
//
//  Created by qianfeng on 15-8-4.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    MBPopMenuArrowPositionCenter = 0,
    MBPopMenuArrowPositionLeft,
    MBPopMenuArrowPositionRight
} MBPopMenuArrowPosition;

@class MBPopMenu;

@protocol MBPopMenuDelegate <NSObject>

@optional
/**
 *  回调，用来在popMenu消失时主控制器进行一些操作：如修改箭头方向
 *
 *  @param popMenu 
 */
- (void)popMenuDidDismissed:(MBPopMenu *)popMenu;

@end

@interface MBPopMenu : UIView

/**
 *  箭头位置
 */
@property (nonatomic, assign) MBPopMenuArrowPosition arrowPosition;

/**
 *  是否有阴影效果
 */
@property (nonatomic, assign, getter=isDimBackground) BOOL dimBackground;

@property (nonatomic, assign) id<MBPopMenuDelegate> delegate;

- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype)popMenuWithContentView:(UIView * )contentView;

/**
 *  显示菜单
 *
 *  @param rect
 */
- (void)showInRect:(CGRect)rect;


@end
