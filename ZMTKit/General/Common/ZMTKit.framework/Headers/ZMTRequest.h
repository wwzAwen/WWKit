//
//  ZMTRequest.h
//  ZMTKit
//
//  Created by 王冠华 on 2019/11/28.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMTRequest : NSObject

/// GET 请求
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
              completionBlock:(void (^)(NSError * error, id responseObject))completion;
/// POST请求
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
               completionBlock:(void (^)(NSError * error, id responseObject))completion;

+ (NSURLSessionDataTask *)requestURL:(NSString *)URLString
                          HTTPMethod:(NSString *)httpMethod
                     HTTPHeaderField:(nullable NSDictionary *)httpHeaderField
                       HTTPBodyField:(nullable NSDictionary *)httpBodyField
                          parameters:(id)parameters
                     completionBlock:(void (^)(NSError * error, id responseObject))completion;

@end

NS_ASSUME_NONNULL_END
