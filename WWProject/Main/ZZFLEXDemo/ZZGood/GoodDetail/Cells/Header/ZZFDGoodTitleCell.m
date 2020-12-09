//
//  ZZFDGoodTitleCell.m
//  ZZFLEXDemo
//
//  Created by 李伯坤 on 2017/12/19.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "ZZFDGoodTitleCell.h"
#import "ZZFDGoodListModel.h"

#define     GOOD_TITLE_FONT     [UIFont boldSystemFontOfSize:18]

@interface ZZFDGoodTitleCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZZFDGoodTitleCell

+ (CGSize)viewSizeByDataModel:(NSString *)dataModel
{
    CGFloat height = [dataModel sizeWithStringFont:GOOD_TITLE_FONT width:kScreenWidth - 30].height + 20;
    return CGSizeMake(kScreenWidth, height);
}

- (void)setViewDataModel:(NSString *)dataModel
{
    [self.titleLabel setText:dataModel];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.titleLabel = self.addLabel(1)
        .numberOfLines(0)
        .font(GOOD_TITLE_FONT)
        .masonry(^(UIView *senderView, MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.bottom.mas_equalTo(0);
        })
        .view;
    }
    return self;
}

@end
