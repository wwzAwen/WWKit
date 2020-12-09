//
//  UIView+WZVFL.m
//  Masonry
//
//  Created by 王文照 on 2020/7/1.
//

#import "UIView+WZVFL.h"

@implementation UIView (WZVFL)

- (void)setVfl:(WZVFLParseItem *)vfl {
    
    NSAssert(vfl.views.allKeys.count && vfl.visualFormat.length, @"WZVFLParseItem ：属性字典不可为空 不可为空");
    
    NSMutableDictionary *views = [NSMutableDictionary dictionaryWithCapacity:vfl.views.allKeys.count];
    
    for (NSString *key in vfl.views) {
        id value = vfl.views[key];
        NSAssert(![value isEqual:NSNull.null] || value != nil || ![value isEqual:@""], @"WZVFLParseItem ：视图对照表 value 不可为空");
        if ([value isEqual:NSNull.null] || value == nil) return;
        if ([value isKindOfClass:NSString.class] && ![value isEqual:@""]) {
            NSArray *tagPaths = [(NSString *)value componentsSeparatedByString:@"->"];
            NSInteger index = 0;
            UIView *view;
            while (tagPaths.count > index && (view = [self viewWithTag:[tagPaths[index++] integerValue]])) {
                view.translatesAutoresizingMaskIntoConstraints = NO;
            }
            NSAssert(view != nil, @"WZVFLParseItem ：视图对照表 value 不可为空");
            if (view) {
                [views setValue:view forKey:key];
            }
        } else if ([value isKindOfClass:UIView.class]) {
            [(UIView *)value setTranslatesAutoresizingMaskIntoConstraints:NO];// 使用VFL auto resizing 必须禁用
            [views setValue:value forKey:key];
        }
    }
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl.visualFormat options:vfl.options metrics:vfl.metrics views:views];
    [self addConstraints:constraints];
}

- (WZVFLParseItem *)vfl {
    return nil;
}

@end
