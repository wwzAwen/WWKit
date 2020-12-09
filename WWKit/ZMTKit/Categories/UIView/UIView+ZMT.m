//
//  UIView+ZMT.m
//  ZMTKit
//
//  Created by 王文照 on 2019/12/2.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import "UIView+ZMT.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "NSObject+ZMT.h"

@interface UIView (Animation)<CAAnimationDelegate>

@end

@implementation UIView (ZMT)
#pragma mark - frame
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX {
    
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}
- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}


- (CGFloat)bottom {
    return self.frame.size.height + self.frame.origin.y;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

+ (instancetype)loadNib {
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    return arr.firstObject;
}

#pragma mark - layer
- (void)rounded:(CGFloat)cornerRadius {
    [self rounded:cornerRadius width:0 color:nil];
}

- (void)border:(CGFloat)borderWidth color:(UIColor *)borderColor {
    [self rounded:0 width:borderWidth color:borderColor];
}

- (void)rounded:(CGFloat)cornerRadius width:(CGFloat)borderWidth color:(UIColor *)borderColor {
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = [borderColor CGColor];
    self.layer.masksToBounds = YES;
}


-(void)round:(CGFloat)cornerRadius RectCorners:(UIRectCorner)rectCorner {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


-(void)shadow:(UIColor *)shadowColor opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset {
    //给Cell设置阴影效果
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
    self.layer.shadowOffset = offset;
}

- (void)gradient:(NSArray *)colors locations:(NSArray *)locations {
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = CGPointMake(0, 0);//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
    layer.endPoint = CGPointMake(0, 1);//（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
    layer.colors = colors;
    layer.frame = self.layer.bounds;
    if (self.layer.sublayers.count) {
        [self.layer replaceSublayer:self.layer.sublayers[0] with:layer];
    } else {
        [self.layer insertSublayer:layer atIndex:0];
    }
}


#pragma mark - base
- (UIViewController *)viewController {
    
    id nextResponder = [self nextResponder];
    while (nextResponder != nil) {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            UIViewController *vc = (UIViewController *)nextResponder;
            return vc;
        }
        nextResponder = [nextResponder nextResponder];
    }
    return nil;
}

+ (CGFloat)getLabelHeightByWidth:(CGFloat)width Title:(NSString *)title font:(UIFont *)font {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

#pragma mark - 动画
#define ANGLE_TO_RADIAN(angle) ((angle)/180.0 * M_PI)
- (void)shakeAnimation {
    //实例化
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath =@"transform.rotation";
    anim.duration =.25;
    anim.repeatCount = 5;
    anim.values =@[@(ANGLE_TO_RADIAN(-1)),@(ANGLE_TO_RADIAN(1)),@(ANGLE_TO_RADIAN(0))];
    anim.removedOnCompletion = NO;
    anim.fillMode =kCAFillModeForwards;
    anim.delegate = self;
    [self.layer addAnimation:anim forKey:@"shake"];
}

- (void)scaleAnimation {
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:1.5];
    animation.duration=1.0;
    animation.autoreverses=YES;
    animation.repeatCount=MAXFLOAT;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    [self.layer addAnimation:animation forKey:@"zoom"];
}

- (void)endAnimation {
    [self.layer removeAllAnimations];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if ([[self.layer animationForKey:@"shake"] isEqual:anim]) {
//        self.transform = CGAffineTransformMakeRotation(M_PI_4);
        [self performSelector:@selector(shakeAnimation)
                   withObject:nil
                   afterDelay:1];
    }
}

#pragma mark - 截图

- (UIImage *)screenshot:(BOOL)saveToLocal
{
    return [self screenshotSize:self.frame.size saveToLocal:saveToLocal error:nil];
}

- (UIImage *)screenshotSize:(CGSize)size saveToLocal:(BOOL)saveToLocal error:(void(^)(NSString *error))saveError
{
    return [self screenshotSize:size area:CGRectZero scale:2 saveToLocal:saveToLocal error:nil];
}

- (UIImage *)screenshotSize:(CGSize)size area:(CGRect)area scale:(NSInteger)scale saveToLocal:(BOOL)saveToLocal error:(void(^)(NSString *error))saveError
{
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewScreenshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (area.origin.x > 0 || area.origin.y > 0) {
        area = CGRectMake(area.origin.x * scale, area.origin.y * scale, area.size.width * scale, area.size.height * scale);
        CGImageRef imageRef = viewScreenshotImage.CGImage;
        CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, area);
        viewScreenshotImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    }
    if (saveToLocal)
    {
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        [library writeImageToSavedPhotosAlbum:viewScreenshotImage.CGImage orientation:(ALAssetOrientation)viewScreenshotImage.imageOrientation completionBlock:^(NSURL *assetURL, NSError *error) {
            [library assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                if (saveError) {
                    saveError(nil);
                }
                
            } failureBlock:^(NSError *error) {
                if (saveError) {
                    saveError(error.userInfo[@"NSLocalizedFailureReason"]);
                }
            }];
        }];
        //        UIImageWriteToSavedPhotosAlbum(viewScreenshotImage,nil,nil,nil);
    }
    return viewScreenshotImage;
}

@end

@interface UIView (TipViewPrivate)
@property (nonatomic, strong) id __tt_tipview_userData;
@property (nonatomic, copy) void (^__tt_tipview_retryAction)(id userData);
@end

@implementation UIView (TipViewPrivate)

- (void)set__tt_tipview_userData:(id)__tt_tipview_userData
{
    [self tt_setAssociatedObject:__tt_tipview_userData forKey:@"__tt_tipview_userData" association:WWAssociationStrong isAtomic:NO];
}
- (id)__tt_tipview_userData
{
    return [self tt_associatedObjectForKey:@"__tt_tipview_userData"];
}

- (void)set__tt_tipview_retryAction:(void (^)(id))__tt_tipview_retryAction
{
    [self tt_setAssociatedObject:__tt_tipview_retryAction forKey:@"__tt_tipview_retryAction" association:WWAssociationStrong isAtomic:NO];
}
- (void (^)(id))__tt_tipview_retryAction
{
    return [self tt_associatedObjectForKey:@"__tt_tipview_retryAction"];
}

@end

#pragma mark - ## UIView (TipView)
@implementation UIView (TipView)

- (void)showTipView:(UIView *)tipView retryAction:(void (^)(id userData))retryAction
{
    [self showTipView:tipView userData:nil retryAction:retryAction];
}

- (void)showTipView:(UIView *)tipView userData:(id)userData retryAction:(void (^)(id userData))retryAction
{
    if (!tipView) {
        return;
    }
    if (tipView.superview) {
        [tipView removeFromSuperview];
    }
    
    [self setTt_tipView:tipView];
    [self set__tt_tipview_userData:userData];
    [self set__tt_tipview_retryAction:retryAction];
    if (CGRectEqualToRect(tipView.frame, CGRectZero)) {
        if (!CGRectEqualToRect(self.bounds, CGRectZero)) {
            [tipView setFrame:self.bounds];
        }
        else {
            CGRect rect = [UIScreen mainScreen].bounds;
            rect.size.height -= [UIApplication sharedApplication].statusBarFrame.size.height - 44;
            [tipView setFrame:rect];
        }
    }
    
    [self addSubview:tipView];
    
    if (retryAction) {
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__tt_didClickTipView)];
        [tipView addGestureRecognizer:tapGR];
    }
}

- (void)removeTipView
{
    if (self.tt_tipView) {
        [self.tt_tipView removeFromSuperview];
    }
}

- (void)setTt_tipView:(UIView *)tt_tipView
{
    [self tt_setAssociatedObject:tt_tipView forKey:@"__tt_tipView" association:WWAssociationStrong isAtomic:NO];
}
- (UIView *)tt_tipView
{
    return [self tt_associatedObjectForKey:@"__tt_tipView"];
}

#pragma mark - # Event Response
- (void)__tt_didClickTipView
{
    [self removeTipView];
    if (self.__tt_tipview_retryAction) {
        self.__tt_tipview_retryAction(self.__tt_tipview_retryAction);
    }
}


@end
