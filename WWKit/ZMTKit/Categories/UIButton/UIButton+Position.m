//
//  UIButton+Position.m
//  TTCustomeButton
//
//  Created by 闫萌 on 17/2/14.
//  Copyright © 2017 RendezvousAuParadis. All rights reserved.
//

#import "UIButton+Position.h"
#import <objc/runtime.h>
#import <WWKit/UIView+ZMT.h>
static const NSString *KEY_HIT_INSETS = @"HitTestEdgeInsets";

@implementation UIButton (Position)
@dynamic hitInsets;
#pragma mark - Initializing a Class

+ (void)load {
    [self dida_swapSelector:@selector(layoutSubviews) toSwizzled:@selector(dd_layoutSubviews)];
    [self dida_swapSelector:@selector(pointInside:withEvent:) toSwizzled:@selector(dida_PointInside:withEvent:)];
}

+ (void)dida_swapSelector:(SEL)original toSwizzled:(SEL)swizzled {
    NSParameterAssert(original);
    NSParameterAssert(swizzled);
    
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, original);
    Method swizzledMethod = class_getInstanceMethod(class, swizzled);
    
    BOOL flag = class_addMethod(class, original, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (flag) {
        class_replaceMethod(class, swizzled, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


#pragma mark - Laying out Subviews
- (void)dd_layoutSubviews {
    [self dd_layoutSubviews];
    
    if (self.contentPosition == 0) { return; }
    if (!self.imageView.image || self.titleLabel.text.length <= 0) { return; }
    
    CGFloat imgW = self.imageViewSize.width ? : self.imageView.image.size.width;
    CGFloat imgH = self.imageViewSize.height ? : self.imageView.image.size.height;
    
    CGFloat titleW = self.titleLabel.intrinsicContentSize.width;
    CGFloat titleH = self.titleLabel.intrinsicContentSize.height;
    
    if ((self.contentPosition & DDButtonContentPositionImageLeftTitleRight) == DDButtonContentPositionImageLeftTitleRight) {
        CGFloat totalLength = imgW + titleW + self.spacing;
        self.imageView.frame = CGRectMake((self.bounds.size.width - totalLength) * 0.5f, self.imageView.frame.origin.y, imgW, imgH);
        
        self.titleLabel.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.bounds.size.width + self.spacing, self.titleLabel.frame.origin.y, titleW, titleH);
    }
    if ((self.contentPosition & DDButtonContentPositionImageRightTitleLeft) == DDButtonContentPositionImageRightTitleLeft) {
        CGFloat totalLength = imgW + titleW + self.spacing;
        
        self.titleLabel.frame = CGRectMake((self.bounds.size.width - totalLength) * 0.5f, self.titleLabel.frame.origin.y, titleW, titleH);
        
        self.imageView.frame = CGRectMake(self.titleLabel.frame.origin.x + titleW + self.spacing, self.imageView.frame.origin.y, imgW, imgH);
    }
    if ((self.contentPosition & DDButtonContentPositionImageUpTitleDown) == DDButtonContentPositionImageUpTitleDown) {
        CGFloat centerX = CGRectGetMidX(self.bounds);
        
        CGFloat totalHeight = imgH + titleH + self.spacing;
        
        self.imageView.frame = CGRectMake(centerX - imgW * 0.5f, (self.bounds.size.height - totalHeight) * 0.5f, imgW, imgH);
        
        self.titleLabel.frame = CGRectMake(centerX - titleW * 0.5f, self.imageView.frame.origin.y + imgH + self.spacing, titleW, titleH);
    }
    if ((self.contentPosition & DDButtonContentPositionImageDownTitleUp) == DDButtonContentPositionImageDownTitleUp) {
        CGFloat centerX = CGRectGetMidX(self.bounds);
        
        CGFloat totalHeight = imgH + titleH + self.spacing;
        
        self.titleLabel.frame = CGRectMake(centerX - titleW * 0.5f, (self.bounds.size.height - totalHeight) * 0.5f, titleW, titleH);
        
        self.imageView.frame = CGRectMake(centerX - imgW * 0.5f, self.titleLabel.frame.origin.y + titleH + self.spacing, imgW, imgH);
    }
    if ((self.contentPosition & DDButtonContentPositionSubtitleFontImage) == DDButtonContentPositionSubtitleFontImage) {

        self.subTitle.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y, imgW, imgH);
    }
//    switch (self.contentPosition) {
//        case DDButtonContentPositionImageLeftTitleRight: {
//
//
//        }
//        case DDButtonContentPositionImageRightTitleLeft: {
//
//
//        }
//
//        case DDButtonContentPositionImageUpTitleDown: {
//
//
//        }
//        case DDButtonContentPositionImageDownTitleUp: {
//
//
//
//        }
//        case DDButtonContentPositionSubtitleFontImage:{
//
//        }
//            break;
//        default:
//            NSLog(@"类型不对，报警了🚔");
//            break;
//    }
    if ([self imageTitleCenterYSame]) {
        self.imageView.centerY = self.titleLabel.centerY;
    }
}
- (void)imageAndTitleCenterYIsSame{
//    self.imageView.centerY = self.titleLabel.centerY;
    [self setImageTitleCenterYSame:YES];
    
}
#pragma mark - Accessor
- (void)setContentPosition:(DDButtonContentPosition)contentPosition {
    objc_setAssociatedObject(self, @selector(contentPosition), @(contentPosition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (DDButtonContentPosition)contentPosition {
    NSNumber *position = (NSNumber *)(objc_getAssociatedObject(self, @selector(contentPosition)));
    return position.unsignedIntegerValue;
}

- (void)setSpacing:(CGFloat)spacing {
    objc_setAssociatedObject(self, @selector(spacing), @(spacing), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)spacing {
    NSNumber *spacing = (NSNumber *)(objc_getAssociatedObject(self, @selector(spacing)));
    return spacing.doubleValue;
}
- (void)setSubTitle:(UILabel *)subTitle {
    objc_setAssociatedObject(self, @selector(subTitle), subTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)subTitle {
    UILabel *subTitle = (UILabel *)(objc_getAssociatedObject(self, @selector(subTitle)));
    if (![self.subviews containsObject:subTitle]) {
        [self addSubview:subTitle];
    }
    return subTitle;
}
- (void)setImageTitleCenterYSame:(BOOL)centerYSame {
    objc_setAssociatedObject(self, @selector(imageTitleCenterYSame), @(centerYSame), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)imageTitleCenterYSame {
    NSNumber *imageTitleCenterYSame = (NSNumber *)(objc_getAssociatedObject(self, @selector(imageTitleCenterYSame)));
    return imageTitleCenterYSame.boolValue;
}

- (void)setHitInsets:(UIEdgeInsets)hitInsets
{
    NSValue *value = [NSValue value:&hitInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIEdgeInsets)hitInsets
{
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}
- (BOOL)dida_PointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitInsets);
    return CGRectContainsPoint(hitFrame, point);
}

- (void)setImageViewSize:(CGSize)imageViewSize {
    objc_setAssociatedObject(self, @selector(imageViewSize), @(imageViewSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGSize)imageViewSize {
    id size = objc_getAssociatedObject(self, @selector(imageViewSize));
    return [size CGSizeValue];

}
    
@end
