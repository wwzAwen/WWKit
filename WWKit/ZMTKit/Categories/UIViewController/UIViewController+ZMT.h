//
//  UIViewController+ZMT.h
//  ZMTKit
//
//  Created by 王文照 on 2019/12/2.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBarButtonItem+ZMT.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ZMT)
/**
 * navi 状态下 是否添加返回按钮
 */
@property (nonatomic, assign) BOOL isShowBack;
/**
 导航栏添加文本按钮
 
 @param titles 文本数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (NSMutableArray<UIButton *> *)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags colors:(NSArray *)colors;

/**
 导航栏添加图标按钮
 
 @param imageNames 图标数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;
/**
 *  默认返回按钮的点击事件，默认是返回，子类可重写
 */
- (void)backBtnClicked;

/// 结束编辑
- (void)endEditing;

/// 添加消失BarButton（左侧)
- (UIBarButtonItem *)addDismissBarButtonWithTitle:(NSString *)title;
/// 左侧文字BarButton
- (UIBarButtonItem *)addLeftBarButtonWithTitle:(NSString *)title actionBlick:(WWBarButtonActionBlock)actionBlock;
/// 左侧图片BarButton
- (UIBarButtonItem *)addLeftBarButtonWithImage:(UIImage *)image actionBlick:(WWBarButtonActionBlock)actionBlock;
/// 右侧文字BarButton
- (UIBarButtonItem *)addRightBarButtonWithTitle:(NSString *)title actionBlick:(WWBarButtonActionBlock)actionBlock;
/// 右侧图片BarButton
- (UIBarButtonItem *)addRightBarButtonWithImage:(UIImage *)image actionBlick:(WWBarButtonActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
