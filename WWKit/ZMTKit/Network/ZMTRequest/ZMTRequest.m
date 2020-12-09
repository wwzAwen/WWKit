//
//  ZMTRequest.m
//  ZMTKit
//
//  Created by 王冠华 on 2019/11/28.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import "ZMTRequest.h"
#import <AFNetworking/AFNetworking.h>
#import "CommonMacros.h"

@implementation ZMTRequest

+ (AFHTTPSessionManager *)shareManager {
    static AFHTTPSessionManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.requestSerializer.timeoutInterval = [self timeoutInterval];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json",@"text/javascript", @"text/json", nil];
    });
    return _manager;
}

+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
              completionBlock:(ZMTRequestCompletion)completion {
    return [self requestURL:URLString
                 HTTPMethod:@"GET"
            HTTPHeaderField:[self httpHeaderField]
              HTTPBodyField:nil
                 parameters:parameters
            completionBlock:completion];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
               completionBlock:(ZMTRequestCompletion)completion {
    return [self requestURL:URLString
                 HTTPMethod:@"POST"
            HTTPHeaderField:[self httpHeaderField]
              HTTPBodyField:nil
                 parameters:parameters
            completionBlock:completion];
}

+ (NSURLSessionDataTask *)requestURL:(NSString *)URLString
                          HTTPMethod:(NSString *)httpMethod
                     HTTPHeaderField:(nullable NSDictionary *)httpHeaderField
                       HTTPBodyField:(nullable NSDictionary *)httpBodyField
                          parameters:(id)parameters
                     completionBlock:(ZMTRequestCompletion)completion {
    if ([self baseURL] && ![URLString hasPrefix:@"http"]) {
        URLString = [[self baseURL] stringByAppendingString:URLString];
    }
    if ([httpHeaderField isKindOfClass:[NSDictionary class]]) {
        for (NSString *key in httpHeaderField) {
            [[ZMTRequest shareManager].requestSerializer setValue:httpHeaderField[key] forHTTPHeaderField:key];
        }
    }
    NSMutableDictionary *requestBodyField = [self httpBodyField].mutableCopy;
    
    if ([httpMethod isEqualToString:@"POST"]) {
        if ([httpBodyField isKindOfClass:[NSDictionary class]]) {
            for (NSString *key in httpBodyField) {
                [requestBodyField setValue:httpBodyField[key] forKey:key];
            }
        }
        if ([parameters isKindOfClass:[NSDictionary class]]) {
            for (NSString *key in parameters) {
                [requestBodyField setValue:parameters[key] forKey:key];
            }
        }
        dLog(@"POST请求地址：\n%@\n参数：\n%@\n", URLString, requestBodyField);
        return [[self shareManager] POST:URLString
                              parameters:requestBodyField
                                progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (completion) {
                completion(nil, responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completion) {
                completion(error, nil);
            }
        }];
    } else if ([httpMethod isEqualToString:@"GET"]) {
        dLog(@"GET请求地址：\n%@\n参数：\n%@\n", URLString, parameters);
        return [[self shareManager] GET:URLString
                             parameters:parameters
                               progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (completion) {
                completion(nil, responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completion) {
                completion(error, nil);
            }
        }];
    } else {
        return nil;
    }
}

+ (NSString *)baseURL {
    return @"https://calendar.yhzm.net/";
}

+ (NSTimeInterval)timeoutInterval {
    return 30;
}

+ (NSDictionary *)httpHeaderField {
    NSString * bunldID = [[NSBundle mainBundle] bundleIdentifier];
    NSString * plateFormApp = [bunldID isEqualToString:@""] ? @"App Store" : @"ios";
    NSString *clientVersion = [NSString stringWithFormat:@"platform=%@,ver=%@",plateFormApp,[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    return @{
        @"Accept": @"application/json;charset=UTF-8",
        @"Client-Version": clientVersion,
    };
}

+ (NSDictionary *)httpBodyField {
    return @{
        @"versionName":[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
        @"versionCode":@"1",
        @"devicePlatform":@"iOS",
        @"osVersion":[[UIDevice currentDevice] systemVersion],
        @"channelName":@"App Store",
        @"deviceBrand":@"Apple",
        @"fastIOS": @"0",
        @"timestamp":kStrFormat(@"%.f",[NSDate date].timeIntervalSince1970 * 1000)
    };
}

@end
