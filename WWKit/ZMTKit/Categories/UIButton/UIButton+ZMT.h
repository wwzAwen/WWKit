//
//  UIButton+ZMT.h
//  AFNetworking
//
//  Created by 王文照 on 2020/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ZMT)
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *titleForHighlighted;

@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) UIImage *imageForHighlighted;
@property(nonatomic, strong) UIImage *imageForSelected;

@property(nonatomic, strong) UIImage *backgroundImage;
@property(nonatomic, strong) UIImage *backgroundImageForHighlighted;

@property(nonatomic, strong) UIColor *titleColor;
@property(nonatomic, strong) UIColor *titleColorForHighlighted;

- (void)constraintToFit;
@end

NS_ASSUME_NONNULL_END
