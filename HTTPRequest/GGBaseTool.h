//
//  GGBaseTool.h
//  GiftGuide
//
//  Created by qianfeng on 15-8-20.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  基本工具类
 */
@interface GGBaseTool : NSObject

/**
 *  get请求
 */
+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;

/**
 *  post请求
 */
+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;

@end
