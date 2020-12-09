//
//  UIImage+ZMT.h
//  ZMTKit
//
//  Created by 王冠华 on 2019/12/6.
//  Copyright © 2019 ZMT. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZMT)

+ (UIImage *)imageWithColor:(UIColor *)color;
/// 二维码
+ (UIImage *)createQRImageWithQRStr:(NSString *)str withSize:(CGFloat) size;

- (UIImage *)drawInRectWithSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
