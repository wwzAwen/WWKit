//
//  UIBarButtonItem+ZMT.h
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^WWBarButtonActionBlock)(void);

@interface UIBarButtonItem (ZMT)

+ (id)fixItemSpace:(CGFloat)space;

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style actionBlick:(WWBarButtonActionBlock)actionBlock;

- (id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style actionBlick:(WWBarButtonActionBlock)actionBlock;

- (void)setActionBlock:(WWBarButtonActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
