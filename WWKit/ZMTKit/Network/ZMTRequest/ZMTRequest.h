//
//  ZMTRequest.h
//  ZMTKit
//
//  Created by 王冠华 on 2019/11/28.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ZMTRequestCompletion)(NSError * _Nullable error,  id _Nullable responseObject);

@interface ZMTRequest : NSObject

#pragma mark - 可重写配置
+ (NSString *)baseURL;

/// 超时时间
+ (NSTimeInterval)timeoutInterval;

/// 头部参数
+ (NSDictionary *)httpHeaderField;

/// body参数
+ (NSDictionary *)httpBodyField;

#pragma mark - 请求方法
/// GET 请求
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
              completionBlock:(ZMTRequestCompletion)completion;
/// POST请求
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
               completionBlock:(ZMTRequestCompletion)completion;

+ (NSURLSessionDataTask *)requestURL:(NSString *)URLString
                          HTTPMethod:(NSString *)httpMethod
                     HTTPHeaderField:(nullable NSDictionary *)httpHeaderField
                       HTTPBodyField:(nullable NSDictionary *)httpBodyField
                          parameters:(id)parameters
                     completionBlock:(ZMTRequestCompletion)completion;

@end

NS_ASSUME_NONNULL_END
