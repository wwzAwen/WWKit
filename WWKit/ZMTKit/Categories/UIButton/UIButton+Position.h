//
//  UIButton+Position.h
//  TTCustomeButton
//
//  Created by 闫萌 on 17/2/14.
//  Copyright © 2017 RendezvousAuParadis. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 button 的 iamgeView 同 titleLabel 的位置组合
 8.6.5 枚举修改为位移运算，方便组合使用
 */
typedef NS_ENUM(NSUInteger, DDButtonContentPosition) {
    DDButtonContentPositionImageLeftTitleRight = 1 << 0, // 图片左，文字右
    DDButtonContentPositionImageRightTitleLeft = 1 << 1, // 文字左，图片右
    DDButtonContentPositionImageUpTitleDown = 1 << 2, // 图片上，文字下
    DDButtonContentPositionImageDownTitleUp = 1 << 3, // 文字上，图片下
    DDButtonContentPositionSubtitleFontImage = 1 << 4 // 图片上面有文字
};

@interface UIButton (Position)
/** 
 位置组合，请在创建button立即设置，
 仅适用于同时有 iamge 和 title 的情况下，
 否则无效
 */
@property (nonatomic, assign) DDButtonContentPosition contentPosition;
/** image 和 title 之间的距离，默认0 */
@property (nonatomic, assign) CGFloat spacing;

/**扩大btn的点击区域 正数为缩小范围，负数为扩大范围 */
@property (nonatomic, assign) UIEdgeInsets hitInsets;

/** imageView 的 Size */
@property (nonatomic) CGSize imageViewSize;
/**imageView 上加文字 */
@property (nonatomic, strong)UILabel *subTitle;

// 设置文字图片y轴中心点对其
- (void)imageAndTitleCenterYIsSame;
@end
