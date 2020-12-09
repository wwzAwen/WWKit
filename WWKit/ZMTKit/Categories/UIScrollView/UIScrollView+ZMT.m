//
//  UIScrollView+ZMT.m
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import "UIScrollView+ZMT.h"

@implementation UIScrollView (ZMT)
- (void)setNeverAdjustmentContentInset:(BOOL)neverAdjustmentContentInset
{
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
#endif
}
- (BOOL)neverAdjustmentContentInset
{
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        return self.contentInsetAdjustmentBehavior;
    }
#endif
    return NO;
}

@end
