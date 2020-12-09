//
//  TLMineViewController.m
//  TLChat
//
//  Created by 李伯坤 on 2017/7/6.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "TLMineViewController.h"
#import "TLMenuItemCell.h"
#import "TLMenuItem.h"
#import "TLUser.h"
#import "TLMineHeaderCell.h"
#import "WXUserViewController.h"

#define     ClassMineMenuCell       [TLMenuItemCell class]

typedef NS_ENUM(NSInteger, TLMineSectionTag) {
    TLMineSectionTagUserInfo,
    TLMineSectionTagWallet,
    TLMineSectionTagFounction,
    TLMineSectionTagSetting,
};

@interface TLMineViewController () <ZZFlexibleLayoutViewControllerProtocol, UIScrollViewDelegate>

@property (nonatomic, strong) UIView *topView;

@end

@implementation TLMineViewController

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:UIColorFromRGB(239.0, 239.0, 244.0)];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(-1, 0, 0, 0));
    }];
    
    self.topView = self.collectionView.addView(0)
    .backgroundColor([UIColor whiteColor])
    .frame(CGRectMake(0, 0, self.view.frame.size.width, 0))
    .view;

    [self loadMenus];
}

#pragma mark - # Private Methods
- (void)loadMenus
{
    @weakify(self);
    [self clear];
    
    // 用户信息
    TLUser *user = [self defaultUser];
    self.addSection(TLMineSectionTagUserInfo);
    self.addCell([TLMineHeaderCell class]).toSection(TLMineSectionTagUserInfo).withDataModel(user).selectedAction(^ (id model) {
        @strongify(self);
        WXUserViewController *vc = [[WXUserViewController alloc] initWithUserModel:user];
        PushVC(vc);
    });
    
    // 钱包
    self.addSection(TLMineSectionTagWallet).sectionInsets(UIEdgeInsetsMake(10, 0, 0, 0));
    TLMenuItem *wallet = createMenuItem(@"mine_wallet", kLocStr(@"钱包"));
    [wallet setBadge:@""];
    [wallet setSubTitle:@"新到账1024元"];
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagWallet).withDataModel(wallet);
    
    // 功能
    self.addSection(TLMineSectionTagFounction).sectionInsets(UIEdgeInsetsMake(10, 0, 0, 0));
    
    TLMenuItem *collect = createMenuItem(@"mine_favorites", kLocStr(@"收藏"));
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagFounction).withDataModel(collect);
    TLMenuItem *album = createMenuItem(@"mine_album", kLocStr(@"相册"));
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagFounction).withDataModel(album);
    TLMenuItem *card = createMenuItem(@"mine_card", kLocStr(@"卡包"));
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagFounction).withDataModel(card);
    TLMenuItem *expression = createMenuItem(@"mine_expression", kLocStr(@"表情"));
    [expression setBadge:@"NEW"];
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagFounction).withDataModel(expression);
    
    // 设置
    self.addSection(TLMineSectionTagSetting).sectionInsets(UIEdgeInsetsMake(10, 0, 30, 0));
    TLMenuItem *setting = createMenuItem(@"mine_setting", kLocStr(@"设置"));
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagSetting).withDataModel(setting);
    
    [self reloadView];
}

#pragma mark - # Delegate
- (void)collectionViewDidSelectItem:(id)itemModel sectionTag:(NSInteger)sectionTag cellTag:(NSInteger)cellTag className:(NSString *)className indexPath:(NSIndexPath *)indexPath
{
    if ([itemModel isKindOfClass:[TLMenuItem class]]) {
        TLMenuItem *item = itemModel;
        UIViewController *vc = [[UIViewController alloc] init];
        [vc setTitle:item.title];
        [vc.view setBackgroundColor:[UIColor whiteColor]];
        PushVC(vc);
        
        if (item.badge || item.subTitle) {
            item.badge = nil;
            item.subTitle = nil;
            [self reloadView];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        self.topView.y = scrollView.contentOffset.y;
        self.topView.height = -scrollView.contentOffset.y + 1;
    }
}

#pragma mark - # Private
- (TLUser *)defaultUser
{
    TLUser *user = [[TLUser alloc] init];
    user.avatar = @"avatar";
    user.username = @"李伯坤";
    user.userID = @"li-bokun";
    return user;
}

@end
