//
//  UIAlertTool.h
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertTool : NSObject
#pragma mark - # Alert
+ (void)showAlertWithTitle:(nullable NSString *)title;
+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message;
+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(nullable NSString *)cancelButtonTitle;
+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(nullable NSString *)cancelButtonTitle actionHandler:(nullable void (^)(NSInteger buttonIndex))actionHandler;
+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSArray *)otherButtonTitles actionHandler:(nullable void (^)(NSInteger buttonIndex))actionHandler;
@end

NS_ASSUME_NONNULL_END
