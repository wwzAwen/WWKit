//
//  WWMainViewHeader.m
//  WWProject
//
//  Created by 王文照 on 2020/12/9.
//  Copyright © 2020 weigh. All rights reserved.
//

#import "WWMainViewHeader.h"
#import <Masonry.h>

@interface WWMainViewHeader ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation WWMainViewHeader

+ (CGFloat)viewHeightByDataModel:(NSString *)dataModel {
    
    CGFloat height = [dataModel boundingRectWithSize:CGSizeMake(kScreenWidth - 30, MAXFLOAT)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{
                                              NSFontAttributeName : [UIFont systemFontOfSize:18]
                                          }
                                             context:nil].size.height;
    return height;
}

- (void)setViewDataModel:(id)dataModel {
    self.titleLabel.text = dataModel ? : @"";
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.titleLabel = self.addLabel(1).numberOfLines(0)
        .font([UIFont systemFontOfSize:16]).textColor([UIColor darkGrayColor])
        .masonry(^(UIView *senderView, MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_lessThanOrEqualTo(-15);
            make.top.mas_equalTo(20);
        })
        .view;
    }
    return self;
}
@end
