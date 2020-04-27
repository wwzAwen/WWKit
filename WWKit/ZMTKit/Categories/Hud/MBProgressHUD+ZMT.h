//
//  MBProgressHUD+ZMT.h
//  ZMTKit
//
//  Created by 王文照 on 2019/12/2.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (ZMT)
/**
 MBProgressHUD 的二次封装
 */

+ (void)showHint:(NSString *)hint;
+ (void)showMiddleHint:(NSString *)hint;

//+ (void)showTipMessageInWindow:(NSString*)message;
//+ (void)showTipMessageInView:(NSString*)message;
//+ (void)showTipMessageInWindow:(NSString*)message timer:(float)aTimer;
//+ (void)showTipMessageInView:(NSString*)message timer:(float)aTimer;


+ (void)showActivityMessageInWindow:(NSString*)message;
+ (void)showActivityMessageInView:(NSString*)message;
+ (void)showActivityMessageInView:(UIView *)view message:(NSString*)message;
+ (void)showActivityMessageInWindow:(NSString*)message timer:(float)aTimer;
+ (void)showActivityMessageInView:(NSString*)message timer:(float)aTimer;


+ (void)showSuccessMessage:(NSString *)Message;
+ (void)showErrorMessage:(NSString *)Message;
+ (void)showInfoMessage:(NSString *)Message;
+ (void)showWarnMessage:(NSString *)Message;


+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;


+ (void)hideHUD;

//顶部弹出提示
+ (void)showTopTipMessage:(NSString *)msg;
+ (void)showTopTipMessage:(NSString *)msg isWindow:(BOOL) isWindow;
@end

NS_ASSUME_NONNULL_END
