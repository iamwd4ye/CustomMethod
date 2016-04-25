//
//  UIBarButtonItem+Extension.h
//  MicroBlog
//
//  Created by applex on 15/8/3.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)barButtonItemWithNormalImageName:(NSString *)imageName_normal HighlightImageName:(NSString *)imageName_highlight target:(id)target action:(SEL)action;

@end
