//
//  UIImage+Quratz2D.m
//  Quartz2D_ Screenshot
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "UIImage+Quratz2D.h"

#define SCALE 0.2
#define MARGIN 5;

@implementation UIImage (Quratz2D)

+ (instancetype)clipImageToCircleWithSourceImageName:(NSString *)source andDonutWith:(CGFloat)donutWidth andSideColor:(UIColor *)color{
    
    UIImage * sourceImage = [UIImage imageNamed:source];
    
    //open context
    CGFloat contextW = sourceImage.size.width < sourceImage.size.height ? (sourceImage.size.width + donutWidth * 2) : (sourceImage.size.height + donutWidth * 2);
    CGFloat contextH = contextW;
    CGSize imageSize = CGSizeMake(contextW, contextH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    //get context
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //draw big circle
    [color set];
    CGFloat bigRadius = contextW * 0.5;
    CGFloat centerX = contextW * 0.5;
    CGFloat centerY = contextH * 0.5;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
    
    //draw small circle
    CGFloat smallRadius = contextW * 0.5 - donutWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    CGContextClip(ctx);//after image  influenced by this
    
    //draw image
    [sourceImage drawInRect:CGRectMake(donutWidth, donutWidth, contextW - donutWidth * 2, contextH - donutWidth * 2)];
    
    //get image
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype)screenshotWithWiew:(UIView *)view{
    // 1.open context
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    // 2.Render view layer to context
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3.get new image
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.end context
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype)waterMarkImageWithSourceImageName:(NSString *)sourceImage andLogoImageName:(NSString *)logo{
    
    //define a image for source image
    UIImage * image = [UIImage imageNamed:sourceImage];
    
    //context
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    //draw background
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //draw water mark
    UIImage * waterImage = [UIImage imageNamed:logo];
    CGFloat waterW = waterImage.size.width * SCALE;
    CGFloat waterH = waterImage.size.height * SCALE;
    CGFloat waterX = image.size.width - waterW - MARGIN;
    CGFloat waterY = image.size.height - waterH - MARGIN;
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    //get complete image from context
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //end context
    UIGraphicsEndImageContext();
    
    //return newImage
    return newImage;
}

+ (instancetype)stretchImageWithImageName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

@end
