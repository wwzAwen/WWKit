//
//  UIColor+ZMT.h
//  ZMTKit
//
//  Created by 王冠华 on 2019/12/2.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZMT)

/**
 *  Return a UIColor from an SVG color name
 *
 *  @param name The color name
 */
+ (UIColor *)colorFromName:(NSString *)name;

/**
 *  Return a UIColor using the HSL color space
 *
 *  @param hue The color's hue
 *  @param saturation The color's saturation
 *  @param lightness The color's lightness
 */
+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness;

/**
 *  Return a UIColor using the HSL color space and an alpha value
 *
 *  @param hue The color's hue
 *  @param saturation The color's saturation
 *  @param lightness The color's lightness
 *  @param alpha The color's alpha value
 */
+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;

/**
 *  Return a UIColor from a 3- or 6-digit hex string
 *
 *  @param hexString The hex color string value
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 *  Return a UIColor from a 3- or 6-digit hex string and an alpha value
 *
 *  @param hexString The hex color string value
 *  @param alpha The color's alpha value
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString withAlpha:(CGFloat)alpha;

/**
 *  Return a UIColor from a RGBA int
 *
 *  @param value The int value
 */
+ (UIColor *)colorWithRGBAValue:(uint)value;

/**
 *  Return a UIColor from a ARGB int
 *
 *  @param value The int value
 */
+ (UIColor *)colorWithARGBValue:(uint)value;

/**
 *  Return a UIColor from a RGB int
 *
 *  @param value The int value
 */
+ (UIColor *)colorWithRGBValue:(uint)value;

/**
 *  16进制 转为 UIColor
 *  @param hex 16进制 0x000000
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(UInt32)hex;

/**
 *  16进制 转换为 UIColor
 *  @param hex 16进制 0x000000
 *  @param opacity 透明度
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(UInt32)hex alpha:(float)opacity;

/**
 *  Convert this color to HSLA
 *
 *  @param hue A float pointer that will be set by this conversion
 *  @param saturation A float pointer that will be set by this conversion
 *  @param lightness A float pointer that will be set by this conversion
 *  @param alpha A float pointer that will be set by this conversion
 */
- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation lightness:(CGFloat *)lightness alpha:(CGFloat *)alpha;

/**
 *  Determine if this color is opaque. Essentially, this returns true if the alpha channel is 1.0
 */
- (BOOL)isOpaque;

/**
 *  Adds percent to the lightness channel of this color
 */
- (UIColor *)darkenByPercent:(CGFloat)percent;

/**
 *  Subtracts percent from the lightness channel of this color
 */
- (UIColor *)lightenByPercent:(CGFloat)percent;

+ (UIColor *)randomColor;

+ (UIColor *)color:(UIColor *)color_ withAlpha:(float)alpha_;

#pragma mark - <-- 基础色 -->
@property(nonatomic, class, readonly) UIColor *Blue;
@property(nonatomic, class, readonly) UIColor *Blue1;
@property(nonatomic, class, readonly) UIColor *Blue2;

@property(nonatomic, class, readonly) UIColor *Green;
@property(nonatomic, class, readonly) UIColor *Green1;
@property(nonatomic, class, readonly) UIColor *Green2;

@property(nonatomic, class, readonly) UIColor *Red;
@property(nonatomic, class, readonly) UIColor *Red1;
@property(nonatomic, class, readonly) UIColor *Red2;

@property(nonatomic, class, readonly) UIColor *Orange;
@property(nonatomic, class, readonly) UIColor *Orange1;
@property(nonatomic, class, readonly) UIColor *Orange2;

@property(nonatomic, class, readonly) UIColor *Gray;
@property(nonatomic, class, readonly) UIColor *Gray1;
@property(nonatomic, class, readonly) UIColor *Gray2;
@end

NS_ASSUME_NONNULL_END
