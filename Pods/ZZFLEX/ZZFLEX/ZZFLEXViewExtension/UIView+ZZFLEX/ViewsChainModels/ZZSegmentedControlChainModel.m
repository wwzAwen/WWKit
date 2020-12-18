//
//  ZZSegmentedControlChainModel.m
//  DoraemonKit
//
//  Created by 王文照 on 2020/11/23.
//

#import "ZZSegmentedControlChainModel.h"

#define     ZZFLEX_CHAIN_SegmentedControl_IMPLEMENTATION(methodName, ZZParamType)      ZZFLEX_CHAIN_IMPLEMENTATION(methodName, ZZParamType, ZZSegmentedControlChainModel *, UISegmentedControl)

@implementation ZZSegmentedControlChainModel


ZZFLEX_CHAIN_SegmentedControl_IMPLEMENTATION(momentary, BOOL);
ZZFLEX_CHAIN_SegmentedControl_IMPLEMENTATION(apportionsSegmentWidthsByContent, BOOL);
ZZFLEX_CHAIN_SegmentedControl_IMPLEMENTATION(selectedSegmentIndex, int);
//ZZFLEX_CHAIN_SegmentedControl_IMPLEMENTATION(selectedSegmentTintColor, UIColor *);

- (ZZSegmentedControlChainModel * _Nonnull (^)(UIImage * _Nonnull, NSInteger))setImage {
    return ^id (UIImage * _Nonnull img, NSInteger index) {
        [(UISegmentedControl *)self.view setImage:img forSegmentAtIndex:index];
        return self;
    };
}

- (ZZSegmentedControlChainModel * _Nonnull (^)(UIImage * _Nonnull, NSInteger, BOOL))insertImage {
    return ^id (UIImage * _Nonnull img, NSInteger index, BOOL animated) {
        [(UISegmentedControl *)self.view insertSegmentWithImage:img atIndex:index animated:animated];
        return self;
    };
}

- (ZZSegmentedControlChainModel * _Nonnull (^)(NSString * _Nonnull, NSInteger))setTitle {
    return ^id (NSString * _Nonnull title, NSInteger index) {
        [(UISegmentedControl *)self.view setTitle:title forSegmentAtIndex:index];
        return self;
    };
}

- (ZZSegmentedControlChainModel * _Nonnull (^)(NSString * _Nonnull, NSInteger, BOOL))insertTitle {
    return ^id (NSString * _Nonnull title, NSInteger index, BOOL animated) {
        [(UISegmentedControl *)self.view insertSegmentWithTitle:title atIndex:index animated:animated];
        return self;
    };
}

- (ZZSegmentedControlChainModel * _Nonnull (^)(UIAction * _Nonnull, NSInteger))setAction API_AVAILABLE(ios(14.0)) {
    return ^id (UIAction * _Nonnull action, NSInteger index) {
#ifdef __IPHONE_14_0
        [(UISegmentedControl *)self.view setAction:action forSegmentAtIndex:index];
#endif
        return self;
    };
}

- (ZZSegmentedControlChainModel * _Nonnull (^)(UIAction * _Nonnull, NSInteger, BOOL))insertAction API_AVAILABLE(ios(14.0)) {
    return ^id (UIAction * _Nonnull action, NSInteger index, BOOL animated) {
#ifdef __IPHONE_14_0
        [(UISegmentedControl *)self.view insertSegmentWithAction:action atIndex:index animated:animated];
#endif
        return self;
    };
}


- (ZZSegmentedControlChainModel * _Nonnull (^)(CGFloat, NSInteger))setWidth {
    return ^id (CGFloat width, NSInteger index) {
        [(UISegmentedControl *)self.view setWidth:width forSegmentAtIndex:index];
        return self;
    };
}

- (ZZSegmentedControlChainModel * _Nonnull (^)(CGSize, NSInteger))setContentOffset {
    return ^id (CGSize offset, NSInteger index) {
        [(UISegmentedControl *)self.view setContentOffset:offset forSegmentAtIndex:index];
        return self;
    };
}

- (ZZSegmentedControlChainModel * _Nonnull (^)(BOOL, NSInteger))setEnabledAtIndex {
    return ^id (BOOL enabled, NSInteger index) {
        [(UISegmentedControl *)self.view setEnabled:enabled forSegmentAtIndex:index];
        return self;
    };
}

- (ZZSegmentedControlChainModel * _Nonnull (^)(NSUInteger, BOOL))removeSegment {
    return ^id (NSUInteger index, BOOL animated) {
        [(UISegmentedControl *)self.view removeSegmentAtIndex:index animated:animated];
        return self;
    };
}

- (ZZSegmentedControlChainModel * _Nonnull (^)(void))removeAllSegments {
    return ^id (void) {
        [(UISegmentedControl *)self.view removeAllSegments];
        return self;
    };
}
@end

ZZFLEX_EX_IMPLEMENTATION(UISegmentedControl, ZZSegmentedControlChainModel);
