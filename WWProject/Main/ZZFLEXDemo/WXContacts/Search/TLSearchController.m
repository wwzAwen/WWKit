//
//  TLSearchController.m
//  ZZFLEXDemo
//
//  Created by 李伯坤 on 2018/2/3.
//  Copyright © 2018年 李伯坤. All rights reserved.
//

#import "TLSearchController.h"

@implementation TLSearchController

+ (TLSearchController *)createWithResultVC:(UIViewController<UISearchResultsUpdating> *)searchResultVC
{
    TLSearchController *searchController = [[TLSearchController alloc] initWithSearchResultsController:searchResultVC];
    [searchController setSearchResultsUpdater:searchResultVC];
    return searchController;
}

- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController
{
    if (self = [super initWithSearchResultsController:searchResultsController]) {
        self.definesPresentationContext = YES;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        [self.searchBar setPlaceholder:kLocStr(@"搜索")];
        [self.searchBar setFrame:CGRectMake(0, 0, kScreenWidth, kSearchBar_Height)];
        [self.searchBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(239.0, 239.0, 244.0)]];
        [self.searchBar setBarTintColor:UIColorFromRGB(239.0, 239.0, 244.0)];
        [self.searchBar setTintColor:[UIColor blackColor]];
        [self.searchBar setTranslucent:NO];
        UITextField *tf = [[[self.searchBar.subviews firstObject] subviews] lastObject];
        [tf.layer setMasksToBounds:YES];
        [tf.layer setBorderWidth:0.5];
        [tf.layer setBorderColor:[UIColor colorWithWhite:0.5 alpha:0.3].CGColor];
        [tf.layer setCornerRadius:5.0f];
        
        for (UIView *view in self.searchBar.subviews[0].subviews) {
            if ([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                UIView *bg = [[UIView alloc] init];
                [bg setBackgroundColor:UIColorFromRGB(239.0, 239.0, 244.0)];
                [view addSubview:bg];
                [bg mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(0);
                }];
                
                UIView *line = [[UIView alloc] init];
                [line setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.3]];
                [view addSubview:line];
                [line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.and.right.and.bottom.mas_equalTo(0);
                    make.height.mas_equalTo(0.5);
                }];
                break;
            }
        }
    }
    
    return self;
}

@end
