//
//  ZZBaseViewChainModel.m
//  zhuanzhuan
//
//  Created by lbk on 2017/10/24.
//  Copyright © 2017年 zz. All rights reserved.
//

#import "ZZBaseViewChainModel.h"
#import "UIView+ZZFrame.h"
#import <Masonry/Masonry.h>
#import "UIView+WZVFL.h"
#import "WZObserver.h"
@class WZVFLParseItem;
#define     ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(methodName, ZZParamType)      ZZFLEX_CHAIN_IMPLEMENTATION(methodName, ZZParamType, __kindof ZZBaseViewChainModel *, UIView)

#define     ZZFLEX_CHAIN_MASONRY_IMPLEMENTATION(methodName, masonryMethod) \
- (id (^)( void (^constraints)(__kindof UIView *, MASConstraintMaker *)) )methodName    \
{   \
return ^__kindof ZZBaseViewChainModel *( void (^constraints)(__kindof UIView *, MASConstraintMaker *) ) {  \
if (self.view.superview) { \
[self.view masonryMethod:^(MASConstraintMaker *make){   \
constraints(self.view, make);   \
}];    \
}   \
return self;    \
};  \
}

#define     ZZFLEX_CHAIN_MASONRY_IMPLEMENTATION_NULL(methodName, masonryMethod) \
- (id (^)( void (^constraints)(__kindof UIView *, MASConstraintMaker *)) )methodName    \
{   \
return ^id ( void (^constraints)(__kindof UIView *, MASConstraintMaker *) ) {  \
return self;    \
};  \
}

#define     ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(methodName, ZZParamType) \
- (id (^)(ZZParamType param))methodName    \
{   \
return ^id (ZZParamType param) {    \
self.view.layer.methodName = param;   \
return self;    \
};\
}

@implementation ZZBaseViewChainModel

- (id)initWithTag:(NSInteger)tag andView:(__kindof UIView *)view
{
    if (self = [super init]) {
        _tag = tag;
        _view = view;
        [view setTag:tag];
    }
    return self;
}

#pragma mark - # Frame
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(frame, CGRect);

ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(origin, CGPoint);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(x, CGFloat);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(y, CGFloat);

ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(size, CGSize);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(width, CGFloat);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(height, CGFloat);

ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(center, CGPoint);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(centerX, CGFloat);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(centerY, CGFloat);

ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(top, CGFloat);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(bottom, CGFloat);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(left, CGFloat);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(right, CGFloat);


#pragma mark - # Layout
#if __has_include(<Masonry/Masonry.h>) || __has_include("Masonry.h")
ZZFLEX_CHAIN_MASONRY_IMPLEMENTATION(masonry, mas_makeConstraints);
ZZFLEX_CHAIN_MASONRY_IMPLEMENTATION(updateMasonry, mas_updateConstraints);
ZZFLEX_CHAIN_MASONRY_IMPLEMENTATION(remakeMasonry, mas_remakeConstraints);
#else
ZZFLEX_CHAIN_MASONRY_IMPLEMENTATION_NULL(masonry, mas_makeConstraints);
ZZFLEX_CHAIN_MASONRY_IMPLEMENTATION_NULL(updateMasonry, mas_updateConstraints);
ZZFLEX_CHAIN_MASONRY_IMPLEMENTATION_NULL(remakeMasonry, mas_remakeConstraints);
#endif

#pragma mark - # Color
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(backgroundColor, UIColor *);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(tintColor, UIColor *);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(alpha, CGFloat);


#pragma mark - # Control
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(contentMode, UIViewContentMode);

ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(opaque, BOOL);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(hidden, BOOL);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(clipsToBounds, BOOL);

ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(userInteractionEnabled, BOOL);
ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(multipleTouchEnabled, BOOL);


#pragma mark - # Layer
ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(masksToBounds, BOOL);

- (id (^)(CGFloat cornerRadius))cornerRadius
{
    return ^__kindof ZZBaseViewChainModel *(CGFloat cornerRadius) {
        [self.view.layer setMasksToBounds:YES];
        [self.view.layer setCornerRadius:cornerRadius];
        return self;
    };
}

- (id (^)(CGFloat borderWidth, UIColor *borderColor))border
{
    return ^__kindof ZZBaseViewChainModel *(CGFloat borderWidth, UIColor *borderColor) {
        [self.view.layer setBorderWidth:borderWidth];
        [self.view.layer setBorderColor:borderColor.CGColor];
        return self;
    };
}
ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(borderWidth, CGFloat);
ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(borderColor, CGColorRef);

ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(zPosition, CGFloat);
ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(anchorPoint, CGPoint);

- (id (^)(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity))shadow
{
    return ^__kindof ZZBaseViewChainModel *(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity) {
        [self.view.layer setShadowOffset:shadowOffset];
        [self.view.layer setShadowRadius:shadowRadius];
        [self.view.layer setShadowColor:shadowColor.CGColor];
        [self.view.layer setShadowOpacity:shadowOpacity];
        return self;
    };
}
ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(shadowColor, CGColorRef);
ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(shadowOpacity, CGFloat);
ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(shadowOffset, CGSize);
ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(shadowRadius, CGFloat);


ZZFLEX_CHAIN_LAYER_IMPLEMENTATION(transform, CATransform3D);


- (id (^)(void (^content)(id sender)))addSubView {
    return ^__kindof ZZBaseViewChainModel *(void (^content)(id sender)) {
        content(self.view);
        return self;
    };
}


ZZFLEX_CHAIN_VIEW_IMPLEMENTATION(vfl, WZVFLParseItem *);

- (id (^)(id data, NSString *keyPath, NSString *toPath))bindData
{
    return ^__kindof ZZBaseViewChainModel *(id data, NSString *keyPath, NSString *toPath) {
        [self.view.Observer bindDataWithModel:data bindKeyPath:keyPath toPath:toPath];
        return self;
    };
}


@end

