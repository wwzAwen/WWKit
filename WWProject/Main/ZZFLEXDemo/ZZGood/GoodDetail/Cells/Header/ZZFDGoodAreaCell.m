//
//  ZZFDGoodAreaCell.m
//  ZZFLEXDemo
//
//  Created by 李伯坤 on 2017/12/20.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "ZZFDGoodAreaCell.h"

#define     GOOD_FONT_AREA          [UIFont systemFontOfSize:12]

@interface ZZFDGoodAreaCell ()

@property (nonatomic, strong) UIButton *titleButton;

@property (nonatomic, strong) NSString *data;

@property (nonatomic, copy) id (^eventAction)(NSInteger type, id data);

@end

@implementation ZZFDGoodAreaCell

+ (CGFloat)viewHeightByDataModel:(id)dataModel
{
    return 36;
}

- (void)setViewDataModel:(NSString *)dataModel
{
    self.data = dataModel;
    [self.titleButton setTitle:dataModel forState:UIControlStateNormal];
    CGFloat width = [dataModel sizeWithStringFont:GOOD_FONT_AREA width:MAXFLOAT height:12].width + 20;
    if (self.titleButton.width != width) {
        [self.titleButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
        }];
    }
}

- (void)setViewEventAction:(id (^)(NSInteger, id))eventAction
{
    self.eventAction = eventAction;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        @weakify(self);
        self.titleButton = self.addButton(0)
        .titleFont(GOOD_FONT_AREA)
        .titleColor([UIColor lightGrayColor])
        .cornerRadius(12)
        .backgroundColor(UIColorFromRGB(239.0, 239.0, 244.0))
        .backgroundColorHL(UIColorFromRGB(192, 192, 192))
        .masonry(^(UIView *senderView, MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(24);
        })
        .eventBlock(UIControlEventTouchUpInside, ^(UIButton *sender) {
            @strongify(self);
            if (self.eventAction) {
                self.eventAction(0, self.data);
            }
        })
        .view;
    }
    return self;
}

@end

