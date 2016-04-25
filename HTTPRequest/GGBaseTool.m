//
//  GGBaseTool.m
//  GiftGuide
//
//  Created by qianfeng on 15-8-20.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "GGBaseTool.h"
#import "GGHttpTool.h"
#import "MJExtension.h"

@implementation GGBaseTool

+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    
    [GGHttpTool get:url parameters:params success:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    
    [GGHttpTool post:url parameters:params success:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
