//
//  UIScrollView+ZMT.h
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (ZMT)
- (void)setNeverAdjustmentContentInset:(BOOL)neverAdjustmentContentInset;
- (BOOL)neverAdjustmentContentInset;
@end

NS_ASSUME_NONNULL_END
