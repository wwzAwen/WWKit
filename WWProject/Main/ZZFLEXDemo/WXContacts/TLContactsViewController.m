//
//  TLContactsViewController.m
//  TLChat
//
//  Created by 李伯坤 on 16/1/23.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLContactsViewController.h"
#import "TLContactsAngel.h"
#import "TLFriendHelper.h"
#import "TLSearchController.h"
#import "TLContactsSearchResultViewController.h"
#import "WXUserViewController.h"

@interface TLContactsViewController ()

/// 列表数据及控制中心
@property (nonatomic, strong) TLContactsAngel *listAngel;

/// 总好友数
@property (nonatomic, strong) UILabel *footerLabel;

/// 搜索
@property (nonatomic, strong) TLSearchController *searchController;

@end

@implementation TLContactsViewController

- (void)loadView
{
    [super loadView];
    [self setTitle:kLocStr(@"通讯录")];
    
    self.tableView.zz_setup.backgroundColor(UIColorFromRGB(239.0, 239.0, 244.0)).separatorStyle(UITableViewCellSeparatorStyleNone)
    .tableHeaderView(self.searchController.searchBar).tableFooterView(self.footerLabel)
    .estimatedRowHeight(0).estimatedSectionFooterHeight(0).estimatedSectionHeaderHeight(0)
    .sectionIndexBackgroundColor([UIColor clearColor]).sectionIndexColor([UIColor darkGrayColor]);
    
    @weakify(self);
    self.listAngel = [[TLContactsAngel alloc] initWithHostView:self.tableView pushAction:^(__kindof UIViewController *vc) {
        @strongify(self);
        PushVC(vc);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 开始监听通讯录数据
    [self p_startMonitorContactsData];
}

#pragma mark - # Pirvate Methods
- (void)p_startMonitorContactsData
{
    [self.listAngel resetListWithContactsData:[TLFriendHelper sharedFriendHelper].data sectionHeaders:[TLFriendHelper sharedFriendHelper].sectionHeaders];
    [self.footerLabel setText:[NSString stringWithFormat:@"%ld%@", (long)[TLFriendHelper sharedFriendHelper].friendCount, kLocStr(@"位联系人")]];
    [self.tableView reloadData];
    
    @weakify(self);
    [[TLFriendHelper sharedFriendHelper] setDataChangedBlock:^(NSMutableArray *data, NSMutableArray *headers, NSInteger friendCount) {
        @strongify(self);
        [self.listAngel resetListWithContactsData:[TLFriendHelper sharedFriendHelper].data sectionHeaders:[TLFriendHelper sharedFriendHelper].sectionHeaders];
        [self.footerLabel setText:[NSString stringWithFormat:@"%ld%@", (long)friendCount, kLocStr(@"位联系人")]];
        [self.tableView reloadData];
    }];
}

#pragma mark - # Getters
- (TLSearchController *)searchController
{
    if (_searchController == nil) {
        TLContactsSearchResultViewController *resultVC = [[TLContactsSearchResultViewController alloc] init];
        @weakify(self);
        [resultVC setItemSelectedAction:^(TLContactsSearchResultViewController *searchVC, TLUser *userModel) {
            @strongify(self);
            [self.searchController setActive:NO];
            WXUserViewController *detailVC = [[WXUserViewController alloc] initWithUserModel:userModel];
            PushVC(detailVC);
        }];
        _searchController = [TLSearchController createWithResultVC:resultVC];
    }
    return _searchController;
}

- (UILabel *)footerLabel
{
    if (_footerLabel == nil) {
        _footerLabel= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50.0f)];
        _footerLabel.zz_setup.textAlignment(NSTextAlignmentCenter).font([UIFont systemFontOfSize:17.0f]).textColor([UIColor grayColor]);
    }
    return _footerLabel;
}

@end
