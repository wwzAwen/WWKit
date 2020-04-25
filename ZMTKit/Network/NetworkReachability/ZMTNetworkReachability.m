//
//  ZMTNetworkReachability.m
//  ZMTKit
//
//  Created by 王冠华 on 2019/12/7.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import "ZMTNetworkReachability.h"
#import <AFNetworking/AFNetworking.h>

@implementation ZMTNetworkReachability

+ (void)setReachabilityStatusChangeBlock:(nullable void (^)(ZMTNetworkReachabilityStatus status))block {
    SCNetworkReachabilityRef ref = SCNetworkReachabilityCreateWithName(NULL, [@"https://calendar.yhzm.net/" UTF8String]);
    AFNetworkReachabilityManager * manager = [[AFNetworkReachabilityManager alloc] initWithReachability:ref];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (block) {
            block((NSInteger)status);
        }
    }];
    [manager startMonitoring];
}
@end
