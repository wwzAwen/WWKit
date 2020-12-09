//
//  UIView+ZZFLEX.m
//  zhuanzhuan
//
//  Created by lbk on 2017/10/24.
//  Copyright © 2017年 zz. All rights reserved.
//

#import "UIView+ZZFLEX.h"

#define ZZFLEX_VE_API(methodName, ZZChainModelClass, UIViewClass) \
- (ZZChainModelClass * (^)(NSInteger tag))methodName    \
{   \
    return ^ZZChainModelClass* (NSInteger tag) {      \
        UIViewClass *view = UIViewClass.zz_create(tag).view;    \
        if ([self isKindOfClass:UIStackView.class]) {   \
            [(UIStackView *)self addArrangedSubview:view]; \
        } else {    \
            [self addSubview:view];     \
        }   \
        ZZChainModelClass *chainModel = [[ZZChainModelClass alloc] initWithTag:tag andView:view]; \
        return chainModel;      \
    };      \
}

@implementation UIView (ZZFLEX)

ZZFLEX_VE_API(addView, ZZViewChainModel, UIView);
ZZFLEX_VE_API(addLabel, ZZLabelChainModel, UILabel);
ZZFLEX_VE_API(addImageView, ZZImageViewChainModel, UIImageView);
ZZFLEX_VE_API(addStackView, WZStackViewChainModel, UIStackView);

#pragma mark - # 按钮类
ZZFLEX_VE_API(addControl, ZZControlChainModel, UIControl);
ZZFLEX_VE_API(addTextField, ZZTextFieldChainModel, UITextField);
ZZFLEX_VE_API(addButton, ZZButtonChainModel, UIButton);
ZZFLEX_VE_API(addSwitch, ZZSwitchChainModel, UISwitch);

- (ZZSegmentedControlChainModel *(^)(NSInteger, NSArray *))addSegmentedControl {
    return ^id (NSInteger tag, NSArray *items) {
        UISegmentedControl *segment = [UISegmentedControl.alloc initWithItems:items];
        if ([self isKindOfClass:UIStackView.class]) {
            [(UIStackView *)self addArrangedSubview:segment];
        } else {
            [self addSubview:segment];
        }
        return [[ZZSegmentedControlChainModel alloc] initWithTag:tag andView:segment];
    };
}

#pragma mark - # 滚动视图类
ZZFLEX_VE_API(addScrollView, ZZScrollViewChainModel, UIScrollView);
ZZFLEX_VE_API(addTextView, ZZTextViewChainModel, UITextView);
ZZFLEX_VE_API(addTableView, ZZTableViewChainModel, UITableView);
ZZFLEX_VE_API(addCollectionView, ZZCollectionViewChainModel, UICollectionView);


- (ZZViewChainModel * (^)( void (^content)(__kindof UIView *)) )addSubView {
    return ^ZZViewChainModel * ( void (^content)(__kindof UIView *) ) {
        ZZViewChainModel *chainModel = [[ZZViewChainModel alloc] initWithTag:self.tag andView:self];
        content(self);
        return chainModel;
    };
}
@end
