//
//  MBSearchBar.m
//  MicroBlog
//
//  Created by qianfeng on 15-8-3.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "MBSearchBar.h"

@implementation MBSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage resizedImageWithName:@"searchbar_textfield_background"];
        //设置垂直居中
        self.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        UIImageView * leftView = [[UIImageView alloc] init];
        leftView.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        leftView.width = leftView.image.size.width + 10;
        leftView.height = leftView.image.size.height;
        
        leftView.contentMode = UIViewContentModeCenter;//default UIViewContentModeScaleToFill
        
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;//default UITextFieldViewModeNever
    }
    return self;
}

+ (instancetype)searchBar{
    return [[self alloc] init];
}

@end
