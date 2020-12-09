//
//  WWMainViewController.m
//  WWProject
//
//  Created by 王文照 on 2020/12/9.
//  Copyright © 2020 weigh. All rights reserved.
//

#import "WWMainViewController.h"
#import "WWMainViewHeader.h"
#import <ZZFLEX/ZZFLEX.h>
#import <Masonry.h>
#import "MainViewController.h"
#import "ZZFDMainViewController.h"
@interface WWMainViewCell : UITableViewCell <ZZFlexibleLayoutViewProtocol>
@end

@implementation WWMainViewCell

+ (CGFloat)viewHeightByDataModel:(id)dataModel {
    return 44;
}

- (void)setViewDataModel:(id)dataModel {
    self.textLabel.text = dataModel ? : @"";
}

@end

@interface WWMainViewController ()
@property (nonatomic, strong) ZZFLEXAngel *angel;
@end

@implementation WWMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    [self.view addSubview:self.tableView];
    self.angel = [[ZZFLEXAngel alloc] initWithHostView:self.tableView];
    self.angel.addSection(1);
    self.angel.setHeader(WWMainViewHeader.class).toSection(1).withDataModel(@"介绍: \n 1 不限定只能 View 与 ViewModel 绑定，只要支持KVC的数据都能双向绑定\n 2 使用链式编程，支持多项绑定\n 3 支持单向数据流/双向数据流\n 4 支持 字符串,整形,浮点型,布尔类型 之间数据自动转换 (对象类型除外)\n 5 支持过滤, 限制，转换, 观察数组某一位数据变化\n 6 无需继承基类，无需手动解绑， 当目标对象内存释放，DataBind自动解绑和释放内存\n");
    
    __weak typeof(self) weakSelf = self;
    self.angel.addCell([WWMainViewCell class]).toSection(1).withDataModel(@"DataBindDemo").selectedAction(^(id model){
        MainViewController *vc = [MainViewController.alloc init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    });
    self.angel.addSection(2);
    self.angel.setHeader(WWMainViewHeader.class).toSection(2).withDataModel(@"介绍: \n一个完善的iOS UI敏捷开发框架，基于UIKit，\n包含常用控件的链式API拓展、\n一个数据驱动的列表框架、一个事件处理队列。");
    self.angel.addCell(WWMainViewCell.class).toSection(2).withDataModel(@"ZZFLEX").selectedAction(^(id model) {
        ZZFDMainViewController *vc = [ZZFDMainViewController.alloc init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    });
    [self.angel reloadView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
