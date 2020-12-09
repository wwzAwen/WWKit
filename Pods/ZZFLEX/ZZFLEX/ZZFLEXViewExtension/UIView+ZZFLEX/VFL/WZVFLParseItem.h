//
//  WZVFLParseItem.h
//  Masonry
//
//  Created by 王文照 on 2020/7/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WZVFLParseItem : NSObject

@property (nonatomic, copy) NSString *visualFormat;
@property (nonatomic, copy) NSDictionary *metrics;
/// key 为在format 里面对应的 view 名  value 为 视图层级 tag path 示例 @{@"1":@"1->2->3"} @"1->2->3"是 本view tag=1的subview 的tag=2的subview 以此类推
@property (nonatomic, copy) NSDictionary *views;
@property (nonatomic, assign) NSLayoutFormatOptions options;

+ (instancetype)ParseItemWithVisualFormar:(NSString *)format metrics:(NSDictionary *)metrics views:(NSDictionary *)views options:(NSLayoutFormatOptions)options;
@end

NS_ASSUME_NONNULL_END
