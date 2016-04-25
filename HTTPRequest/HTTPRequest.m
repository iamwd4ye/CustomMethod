//
//  HTTPRequest.m
//  MusicPlayer
//
//  Created by qianfeng on 15-7-26.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "HTTPRequest.h"

@interface HTTPRequest()<NSURLConnectionDataDelegate>

/**
 *  download data
 */
@property (nonatomic, strong) NSMutableData * downloadData;

/**
 *  all download data size (bytes)
 */
@property (nonatomic, assign) long long allDataSizeBytes;

@end

@implementation HTTPRequest

- (id)initWithstrUrl:(NSString *)strUrl{
    if (self = [super init]) {
        _strUrl = strUrl;
        
        _downloadData = [NSMutableData data];
    }
    return self;
}

- (void)startRequest{
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:_strUrl]];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //clear data
    _downloadData.length = 0;
    
    _allDataSizeBytes = [response expectedContentLength];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [_downloadData appendData:data];
    
    float progress = (float)_downloadData.length / _allDataSizeBytes;
    
    if ([_delegate respondsToSelector:@selector(requestDidProgress:)]) {
        [_delegate requestDidProgress:progress];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [connection cancel];
    
    _responseData = _downloadData;
    _responseString = [[NSString alloc] initWithData:_downloadData encoding:NSUTF8StringEncoding];
    
    if ([_delegate respondsToSelector:@selector(requestDidFinish:)]) {
        [_delegate requestDidFinish:self];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [connection cancel];
    
    if ([_delegate respondsToSelector:@selector(requestDidError:)]) {
        [_delegate requestDidError:error];
    }
}
@end
