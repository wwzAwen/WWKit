//
//  CommonMacros.h
//  ZMTKit
//
//  Created by 王冠华 on 2019/11/27.
//  Copyright © 2019 ZMT. All rights reserved.
//

#ifndef CommonMacros_h
#define CommonMacros_h

#pragma mark - 各种高度
#define kIPhoneXSeries (([[UIApplication sharedApplication] statusBarFrame].size.height == 44.0f) ? (YES):(NO))
#define kScreenWidth             ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight            ([UIScreen mainScreen].bounds.size.height)
#define kStatusBarHeight         [ZMTTools getStatusBarFrame].size.height
#define kTabbarFixHeight         [UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom
#define kNavigationBarHeight     44
#define kToolBarHeight           44

#pragma mark - 快捷方式
#define kStrFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

#pragma mark - 通知
#define kPostNotifition(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj]
#define kNotifitionDefult         [NSNotificationCenter defaultCenter]

#pragma mark - Log
#ifdef DEBUG
#define dLog(FORMAT, ...) \
fprintf(stderr,"[%f] %s:%d\n%s\n",\
[[NSDate date] timeIntervalSince1970],\
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],\
__LINE__,\
[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define dLog(FORMAT, ...) void(dLog)(void)
#endif

#pragma mark - 强弱引用
#define kWeakObj(type)  autoreleasepool{} __weak typeof(type) weak##type = type;
#define kStrongObj(type) autoreleasepool{} __strong typeof(type) type = weak##type;

#pragma mark - 宏单利
// .h
#define singleton_interface(class) +(instancetype) shared##class;
// .m
#define singleton_implementation(class)         \
static class *_instance;                        \
\
+(id) allocWithZone : (struct _NSZone *) zone { \
static dispatch_once_t onceToken;           \
dispatch_once(&onceToken, ^{                \
_instance = [super allocWithZone:zone]; \
});                                         \
\
return _instance;                           \
}                                               \
\
+(instancetype) shared##class                   \
{                                           \
if (_instance == nil) {                     \
_instance = [[class alloc] init];       \
}                                           \
\
return _instance;                            \
}

#endif /* CommonMacros_h */
