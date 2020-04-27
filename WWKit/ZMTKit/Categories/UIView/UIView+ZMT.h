//
//  UIView+ZMT.h
//  ZMTKit
//
//  Created by 王文照 on 2019/12/2.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZMT)
/**  起点x坐标  */
@property (nonatomic, assign) CGFloat x;
/**  起点y坐标  */
@property (nonatomic, assign) CGFloat y;
/**  中心点x坐标  */
@property (nonatomic, assign) CGFloat centerX;
/**  中心点y坐标  */
@property (nonatomic, assign) CGFloat centerY;
/**  宽度  */
@property (nonatomic, assign) CGFloat width;
/**  高度  */
@property (nonatomic, assign) CGFloat height;
/**  顶部  */
@property (nonatomic, assign) CGFloat top;
/**  底部  */
@property (nonatomic, assign) CGFloat bottom;
/**  左边  */
@property (nonatomic, assign) CGFloat left;
/**  右边  */
@property (nonatomic, assign) CGFloat right;
/**  size  */
@property (nonatomic, assign) CGSize size;
/**  origin */
@property (nonatomic, assign) CGPoint origin;

+ (instancetype)loadNib;
/**  设置圆角  */
- (void)rounded:(CGFloat)cornerRadius;
/**  设置圆角和边框  */
- (void)rounded:(CGFloat)cornerRadius width:(CGFloat)borderWidth color:(nullable UIColor *)borderColor;
/**  设置边框  */
- (void)border:(CGFloat)borderWidth color:(UIColor *)borderColor;
/**   给哪几个角设置圆角  */
- (void)round:(CGFloat)cornerRadius RectCorners:(UIRectCorner)rectCorner;
/**  设置阴影  */
- (void)shadow:(UIColor *)shadowColor opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset;
/// 当前view的控制器
- (UIViewController *)viewController;

- (void)gradient:(NSArray *)colors locations:(NSArray *)locations;

+ (CGFloat)getLabelHeightByWidth:(CGFloat)width Title:(NSString *)title font:(UIFont *)font;

#pragma mark - 动画
- (void)shakeAnimation;
- (void)scaleAnimation;
- (void)endAnimation;

#pragma mark - 截图
- (UIImage *)screenshot:(BOOL)saveToLocal;

@end

NS_ASSUME_NONNULL_END
