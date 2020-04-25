//
//  ZMTNetworkReachability.h
//  ZMTKit
//
//  Created by 王冠华 on 2019/12/7.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZMTNetworkReachabilityStatus) {
    ZMTNetworkReachabilityStatusUnknown          = -1,  // 网络状态未知
    ZMTNetworkReachabilityStatusNotReachable     = 0,   // 没有网络
    ZMTNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G|4G蜂窝移动网络
    ZMTNetworkReachabilityStatusReachableViaWiFi = 2,   // WIFI网络
};

@interface ZMTNetworkReachability : NSObject

+ (void)setReachabilityStatusChangeBlock:(nullable void (^)(ZMTNetworkReachabilityStatus status))block;

@end

NS_ASSUME_NONNULL_END
