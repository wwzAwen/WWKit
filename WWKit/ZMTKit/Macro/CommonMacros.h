//
//  CommonMacros.h
//  ZMTKit
//
//  Created by 王冠华 on 2019/11/27.
//  Copyright © 2019 ZMT. All rights reserved.
//

#ifndef CommonMacros_h
#define CommonMacros_h

#import "ZMTTools.h"
#import "UIColor+ZMT.h"
#define PERFORM_BLOCK_SAFELY( b, ... ) if ( (b) ) { (b)(__VA_ARGS__); }

#pragma mark - 各种高度
#define kIPhoneXSeries (([[UIApplication sharedApplication] statusBarFrame].size.height == 44.0f) ? (YES):(NO))
#define kScreenWidth             ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight            ([UIScreen mainScreen].bounds.size.height)
#define kScale                   kScreenWidth / 375
#define kStatusBarHeight         [ZMTTools getStatusBarFrame].size.height
#define kZMTStatusBarHeight      [[UIApplication sharedApplication] statusBarFrame].size.height
#define kTabbarFixHeight         [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom
#define kNavigationBarHeight     44
#define kToolBarHeight           44
#define kTopHeight               kNavigationBarHeight + kZMTStatusBarHeight
#define kSearchBar_Height        (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0") ? 52.0f : 44.0f)

#define kColorFromRGB(RGB, A)    [UIColor colorWithRed:((float)(((RGB) & 0xFF0000) >> 16))/255.0 green:((float)(((RGB) & 0xFF00) >> 8))/255.0 blue:((float)((RGB) & 0xFF))/255.0 alpha:(A)]
#define UIColorHex(hex)          [UIColor colorWithHexString:hex]
#define UIColorFromRGB(r,g,b)    UIColorFromRGBA(r,g,b,1)
#define UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark - 版本
#define kShortVersion    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kVersionCode     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#pragma mark - 快捷方式
#define kStrFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
#define kLoadNib(fName, boudle) [UINib nibWithNibName:fName bundle:boudle]
/// 国际化
#define kLocStr(str)                 NSLocalizedString(str, nil)

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

#pragma mark - 便利获取对象
#define kAppDelegate         ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define kUserDefaults        [NSUserDefaults standardUserDefaults]
#define kWindow              [UIApplication sharedApplication].delegate.window

#pragma mark - 条件判断
#define kRespondsToSelector(_c, _m) ([_c respondsToSelector:_m])
#define kHAVECONTROLLER(value) if(value == nil || value.controller == nil){return;}
#define kISNull(_x)   ([_x isKindOfClass:[NSNull class]] || _x == nil)
#define kIsArray(value) (value != nil && [value isKindOfClass:[NSArray class]])
#define kARR_Eempty(arr) (kIsArray(arr) && arr != nil && [arr count] > 0)
#define kIsDic(d) (d != nil && [d isKindOfClass:[NSDictionary class]])
#define kKeyInDic(dic, k) (kIsDic(dic) && [[dic allKeys] containsObject:k])
#define kIsNumber(f) (f != nil && [f isKindOfClass:[NSNumber class]])
#define kValidClass(f,cls) (f != nil && [f isKindOfClass:[cls class]])
#define kIsData(value) (value != nil && [value isKindOfClass:[NSData class]])
#define kStrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && [f length] > 0)
#define kStrReal(_v) kStrValid(_v)?_v:@""
#define kStrAppendStr(str1, str2) [str1 stringByAppendingString:kStrReal(str2)]
#define kStrToNSURL(str) [NSURL URLWithString:[kStrReal(str) stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]]
#define kStrIsEqu(_s, _s1) [_s isEqualToString:_s1]
#define kStrFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
#define kStrWithInt(i) kStrFormat(@"%d", i)
#define kStrWithInterger(i) kStrFormat(@"%ld", i)
#define kStrWithFloat(i) kStrFormat(@"%.2f", i)
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

#pragma mark - 强弱引用
#define kWeakObj(type)  autoreleasepool{} __weak typeof(type) weak##type = type;
#define kStrongObj(type) autoreleasepool{} __strong typeof(type) type = weak##type;

#pragma mark - # 循环引用消除
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object)     autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object)     autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object)     try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object)     try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object)   autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object)   autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object)   try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object)   try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif
#define     TLWeakSelf(type)            __weak typeof(type) weak##type = type;
#define     TLStrongSelf(type)          __strong typeof(type) strong##type = type;

#pragma mark - # 快捷方法
/// PushVC
#define     PushVC(vc)                  {\
            [vc setHidesBottomBarWhenPushed:YES];\
            [self.navigationController pushViewController:vc animated:YES];\
}


#pragma mark - # 系统版本
#define     SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define     SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define     SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define     SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#endif /* CommonMacros_h */
