//
//  UIImage+Extension.m
//  MicroBlog
//
//  Created by applex on 15/8/2.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage * image = nil;
    if(iOS7) { // 处理iOS7的情况
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    
    if (!image) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (UIImage *)resizedImageWithName:(NSString *)name{
    UIImage * image = [UIImage imageNamed:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
