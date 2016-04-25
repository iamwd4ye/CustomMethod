//
//  GGHttpTool.h
//  GiftGuide
//
//  Created by qianfeng on 15-8-20.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  HTTP 请求工具类
 *  设计该类意图是避免第三方框架AFNetworking对APP其他类的耦合，只有该工具类包含AFNetworking类，如若AFNetworking有修改，只修改该工具类即可
 */
@interface GGHttpTool : NSObject

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)get:(NSString *)strUrl parameters:(NSDictionary *)parameters success:(void(^)(id responseObj))success failure:(void(^)(NSError * error))failure;

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)post:(NSString *)strUrl parameters:(NSDictionary *)parameters success:(void(^)(id responseObj))success failure:(void(^)(NSError * error))failure;

@end
