//
//  UICollectionViewCell+ZMT.m
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import "UICollectionViewCell+ZMT.h"

@implementation UICollectionViewCell (ZMT)
- (void)setSelectedBackgrounColor:(UIColor *)selectedBackgrounColor
{
    if (selectedBackgrounColor) {
        UIView *selectedBGView = [[UIView alloc] init];
        [selectedBGView setBackgroundColor:selectedBackgrounColor];
        [self setSelectedBackgroundView:selectedBGView];
    }
    else {
        [self setSelectedBackgroundView:nil];
    }
}
- (UIColor *)selectedBackgrounColor
{
    return self.selectedBackgroundView.backgroundColor;
}
@end
