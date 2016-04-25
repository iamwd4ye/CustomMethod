//
//  UIImage+Extension.h
//  MicroBlog
//
//  Created by applex on 15/8/2.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  根据名字设置图片
 *
 *  @param name
 *
 *  @return 
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  拉伸图片
 *
 *  @param name
 *
 *  @return
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
@end
