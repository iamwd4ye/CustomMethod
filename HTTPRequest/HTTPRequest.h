//
//  HTTPRequest.h
//  MusicPlayer
//
//  Created by qianfeng on 15-7-26.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HTTPRequest;

@protocol HTTPRequestDelegate <NSObject>

@optional
/**
 *  return progress to delegate
 *
 *  @param progress
 */
- (void)requestDidProgress:(CGFloat)progress;

/**
 *  return finish data to delegate
 *
 *  @param request
 */
- (void)requestDidFinish:(HTTPRequest *)request;

/**
 *  return error reason to delegate
 *
 *  @param error 
 */
- (void)requestDidError:(NSError *)error;

@end

@interface HTTPRequest : NSObject

@property (nonatomic, copy) NSString * strUrl;

@property (nonatomic, assign) id<HTTPRequestDelegate> delegate;

@property (nonatomic, strong) NSData * responseData;
@property (nonatomic, copy) NSString * responseString;

/**
 *  init method
 *
 *  @param strUrl
 *
 *  @return id
 */
- (id)initWithstrUrl:(NSString *)strUrl;

/**
 *  start request
 */
- (void)startRequest;

@end
