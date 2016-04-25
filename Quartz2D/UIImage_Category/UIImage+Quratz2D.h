//
//  UIImage+Quratz2D.h
//  Quartz2D_ Screenshot
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Quratz2D)

/**
 * clip Image To Circle With Source Image Name
 *
 *  @param source
 *
 *  @return
 */
+ (instancetype)clipImageToCircleWithSourceImageName:(NSString *)source andDonutWith:(CGFloat)donutWidth andSideColor:(UIColor *)color;

/**
 *  screenshot With Wiew
 *
 *  @param view
 *
 *  @return
 */
+ (instancetype)screenshotWithWiew:(UIView *)view;

/**
 *  waterMark Image With Source Image Name
 *
 *  @param sourceImage
 *  @param logo
 *
 *  @return
 */
+ (instancetype)waterMarkImageWithSourceImageName:(NSString *)sourceImage andLogoImageName:(NSString *)logo;

/**
 *  stretch image with image name, return a image for arbitrarily stretch 
 *
 *  @param imageName
 *
 *  @return
 */
+ (instancetype)stretchImageWithImageName:(NSString *)imageName;

@end
