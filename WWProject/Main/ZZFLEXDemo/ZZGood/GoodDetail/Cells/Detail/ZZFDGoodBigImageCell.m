//
//  ZZFDGoodBigImageCell.m
//  ZZFLEXDemo
//
//  Created by 李伯坤 on 2017/12/20.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "ZZFDGoodBigImageCell.h"

@interface ZZFDGoodBigImageCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ZZFDGoodBigImageCell

+ (CGSize)viewSizeByDataModel:(id)dataModel
{
    return CGSizeMake(kScreenWidth - 30, (kScreenWidth - 30) * 1.15);
}

- (void)setViewDataModel:(NSString *)dataModel
{
    if (dataModel.length > 0) {
        [self.imageView setBackgroundColor:[UIColor clearColor]];
        [self.imageView setImage:[UIImage imageNamed:dataModel]];
    }
    else {
        [self.imageView setBackgroundColor:UIColorFromRGB(239.0, 239.0, 244.0)];
        [self.imageView setImage:nil];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.imageView = self.contentView.addImageView(1)
        .contentMode(UIViewContentModeScaleAspectFill)
        .clipsToBounds(YES)
        .cornerRadius(6)
        .masonry(^(UIView *senderView, MASConstraintMaker *make){
            make.edges.mas_equalTo(0);
        })
        .view;
    }
    return self;
}

@end
