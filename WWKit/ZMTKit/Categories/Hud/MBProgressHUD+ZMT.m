//
//  MBProgressHUD+ZMT.m
//  ZMTKit
//
//  Created by 王文照 on 2019/12/2.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import "MBProgressHUD+ZMT.h"
#import "CommonMacros.h"
#import "UIWindow+ZMT.h"
#import "UIView+ZMT.h"
const NSInteger hideTime = 2;
@implementation MBProgressHUD (ZMT)



+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message window:(UIView *)window
{
    UIView  *view = window? window:kWindow.currentVC.view;
    MBProgressHUD * hud = [MBProgressHUD HUDForView:view];
    if (!hud) {
        hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    }else{
        [hud showAnimated:YES];
//        [hud show:YES];
    }
    hud.minSize = CGSizeMake(100, 100);
//    hud.labelText = message?message:@"加载中...";
//    hud.labelFont = [UIFont systemFontOfSize:15];
    hud.label.text = message?message:@"加载中...";
    hud.label.font = [UIFont systemFontOfSize:15];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
//    hud.labelColor= [UIColor whiteColor];
//    hud.label.numberOfLinlabelColores = 0;
//    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.9];
//    hud.removeFromSuperViewOnHide = YES;
//    [hud setContentColor:[UIColor whiteColor]];
//        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
//        hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.1f];
    return hud;
}

+ (void)showHint:(NSString *)hint {
    [self showHint:hint WithOffset:CGPointMake(0, 180)];
}

+ (void)showMiddleHint:(NSString *)hint {
    [self showHint:hint WithOffset:CGPointZero];
}

+ (void)showHint:(NSString *)hint WithOffset:(CGPoint)offset {
    if (![hint isKindOfClass:[NSString class]] || hint == nil || [hint isEqualToString:@""]) {
        return;
    }
    //显示提示信息
    UIView *view = [UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    hud.label.text = [NSString stringWithFormat:@"%@",hint];
    hud.offset = offset;
    [hud hideAnimated:YES afterDelay:1.5];
    [view endEditing:YES];
}

#pragma mark-------------------- show Tip----------------------------

//+ (void)showTipMessageInWindow:(NSString*)message
//{
//    [self showTipMessage:message isWindow:true timer:hideTime];
//}
//+ (void)showTipMessageInView:(NSString*)message
//{
//    [self showTipMessage:message isWindow:false timer:hideTime];
//}
//+ (void)showTipMessageInWindow:(NSString*)message timer:(float)aTimer
//{
//    [self showTipMessage:message isWindow:true timer:aTimer];
//}
//+ (void)showTipMessageInView:(NSString*)message timer:(float)aTimer
//{
//    [self showTipMessage:message isWindow:false timer:aTimer];
//}
//+ (void)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
//{
//    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
//    hud.mode = MBProgressHUDModeText;
//    [hud hideAnimated:YES afterDelay:hideTime];
//    [hud hide:YES afterDelay:hideTime];
//}
#pragma mark-------------------- show Activity----------------------------

+ (void)showActivityMessageInWindow:(NSString*)message
{
    [self showActivityMessage:message window:kWindow timer:0];
}
+ (void)showActivityMessageInView:(UIView *)view message:(NSString*)message {
    [self showActivityMessage:message window:view timer:0];
}
+ (void)showActivityMessageInView:(NSString*)message
{
    [self showActivityMessage:message window:nil timer:0];
}
+ (void)showActivityMessageInWindow:(NSString*)message timer:(float)aTimer
{
    [self showActivityMessage:message window:kWindow timer:aTimer];
}
+ (void)showActivityMessageInView:(NSString*)message timer:(float)aTimer
{
    [self showActivityMessage:message window:nil timer:aTimer];
}
+ (void)showActivityMessage:(NSString*)message window:(UIView *)window timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message window:window];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (aTimer>0) {
        [hud hideAnimated:YES afterDelay:hideTime];
//        [hud hide:YES afterDelay:hideTime];
    }
}
#pragma mark-------------------- show Image----------------------------

+ (void)showSuccessMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Success" message:Message];
}
+ (void)showErrorMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Error" message:Message];
}
+ (void)showInfoMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Info" message:Message];
}
+ (void)showWarnMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Warn" message:Message];
}
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message window:kWindow];
    
}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message window:nil];
}
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message window:(UIView *)window
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message window:window];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:hideTime];
//    [hud hide:YES afterDelay:hideTime];
}
+ (void)hideHUD
{
    UIView *view = [UIApplication sharedApplication].delegate.window.currentVC.view;
    [self hideHUDForView:view animated:YES];
}

#pragma mark ————— 顶部tip —————
+ (void)showTopTipMessage:(NSString *)msg {
    [self showTopTipMessage:msg isWindow:NO];
}
+ (void)showTopTipMessage:(NSString *)msg isWindow:(BOOL) isWindow{
    CGFloat padding = 10;
    UIWindow *window = (UIWindow*)[UIApplication sharedApplication].delegate.window;

    UILabel *label = [UILabel new];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.8];
    label.width = kScreenWidth;
//    label.textContainerInset = UIEdgeInsetsMake(padding+padding, padding, 0, padding);
    
    if (isWindow) {
        label.height = 64;
        label.top = -64;
        [window addSubview:label];
        
        [UIView animateWithDuration:0.3 animations:^{
            label.left = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                label.top = -64;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }];
        
    }else{
        label.height = [label sizeThatFits:CGSizeMake(label.width, MAXFLOAT)].height + 2 * padding;
        label.top = -64;
        [window.currentVC.view addSubview:label];
        
        [UIView animateWithDuration:0.3 animations:^{
            label.top = -64;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                label.top = 0;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }];
        
    }
    
}
@end
