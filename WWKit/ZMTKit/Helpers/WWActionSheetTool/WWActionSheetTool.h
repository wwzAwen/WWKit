//
//  WWActionSheetTool.h
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface WWActionSheetItem : NSObject

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, copy) void (^selectAction)(WWActionSheetItem *item);

@end

@interface WWActionSheetTool : UIView
@property (nonatomic, strong) NSMutableArray *otherButtonTitles;

/// 按钮个数
@property (nonatomic, assign, readonly) NSInteger numberOfButtons;

/// 取消按钮index
@property (nonatomic, assign, readonly) NSInteger cancelButtonIndex;

/// 高亮按钮index
@property (nonatomic, assign, readonly) NSInteger destructiveButtonIndex;

/// 点击事件响应block
@property (nonatomic, copy) void (^clickAction)(NSInteger);

- (id)initWithTitle:(NSString *)title
        clickAction:(void (^)(NSInteger buttonIndex))clickAction
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;

@property (nonatomic, strong) UIView *customHeaderView;
@property (nonatomic, copy) void (^cellConfigAction)(UITableViewCell *cell, id title);

/**
 *  显示ActionSheet
 */
- (void)show;

/**
 *  隐藏ActionSheet
 */
- (void)dismiss;

/**
 *  根据index获取按钮标题
 *
 *  @param  buttonIndex     按钮index
 */
- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex;

@end

NS_ASSUME_NONNULL_END
