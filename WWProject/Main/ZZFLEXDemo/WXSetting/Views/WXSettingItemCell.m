//
//  WXSettingItemCell.m
//  ZZFLEXDemo
//
//  Created by 李伯坤 on 2019/4/18.
//  Copyright © 2019 李伯坤. All rights reserved.
//

#import "WXSettingItemCell.h"
#import <WWKit/UICollectionViewCell+ZMT.h>
@interface WXSettingItemCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation WXSettingItemCell

+ (CGFloat)viewHeightByDataModel:(id)dataModel
{
    return 56;
}

- (void)setViewDataModel:(id)dataModel
{
    [self.titleLabel setText:dataModel];
}

- (void)onViewPositionUpdatedWithIndexPath:(NSIndexPath *)indexPath sectionItemCount:(NSInteger)count
{
    if (indexPath.row == 0) {
        self.addSeparator(ZZSeparatorPositionTop);
    }
    if (indexPath.row < count - 1) {
        self.addSeparator(ZZSeparatorPositionBottom).beginAt(15);
    }
    else {
        self.addSeparator(ZZSeparatorPositionBottom);
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setSelectedBackgrounColor:[UIColor colorWithWhite:0.5 alpha:0.3]];
}

@end
