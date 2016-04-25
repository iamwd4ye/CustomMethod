//
//  UIBarButtonItem+Extension.m
//  MicroBlog
//
//  Created by applex on 15/8/3.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)barButtonItemWithNormalImageName:(NSString *)imageName_normal HighlightImageName:(NSString *)imageName_highlight target:(id)target action:(SEL)action{
    
    UIButton * button = [[UIButton alloc] init];
    
    [button setBackgroundImage:[UIImage imageNamed:imageName_normal] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:imageName_highlight] forState:UIControlStateHighlighted];
    
    button.size = button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
