//
//  GGHttpTool.m
//  GiftGuide
//
//  Created by qianfeng on 15-8-20.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "GGHttpTool.h"
#import "AFNetworking.h"

@implementation GGHttpTool

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)get:(NSString *)strUrl parameters:(NSDictionary *)parameters success:(void(^)(id responseObj))success failure:(void(^)(NSError * error))failure{
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:strUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)post:(NSString *)strUrl parameters:(NSDictionary *)parameters success:(void(^)(id responseObj))success failure:(void(^)(NSError * error))failure{
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 2.发送POST请求
    [manager POST:strUrl parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObj) {
              if (success) {
                  success(responseObj);
              }
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (failure) {
                  failure(error);
              }
          }];
}

@end
