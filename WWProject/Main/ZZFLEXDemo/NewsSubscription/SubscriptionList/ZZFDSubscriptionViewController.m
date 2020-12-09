//
//  ZZFDSubscriptionViewController.m
//  ZZFLEXDemo
//
//  Created by 李伯坤 on 2018/2/4.
//  Copyright © 2018年 李伯坤. All rights reserved.
//

#import "ZZFDSubscriptionViewController.h"
#import "ZZFDSubscriptionAngel.h"

@interface ZZFDSubscriptionViewController ()

@property (nonatomic, strong) ZZFDSubscriptionAngel *angel;

@end

@implementation ZZFDSubscriptionViewController

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:UIColorFromRGB(239.0, 239.0, 244.0)];
    [self setTitle:@"我的订阅"];
    
    self.tableView.zz_setup.tableFooterView([UIView new]).separatorStyle(UITableViewCellSeparatorStyleNone)
    .estimatedRowHeight(0).estimatedSectionFooterHeight(0).estimatedSectionHeaderHeight(0);
    
    @weakify(self);
    self.angel = [[ZZFDSubscriptionAngel alloc] initWithHostView:self.tableView pushAction:^(__kindof UIViewController *vc) {
        @strongify(self);
        PushVC(vc);
    }];
    
    [self addRightBarButtonWithTitle:@"编辑" actionBlick:^{
        @strongify(self);
        [self.tableView setEditing:!self.tableView.isEditing];
        [self.navigationItem.rightBarButtonItem setTitle:(self.tableView.isEditing ? @"完成" : @"编辑")];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.angel requestData];
}

@end
