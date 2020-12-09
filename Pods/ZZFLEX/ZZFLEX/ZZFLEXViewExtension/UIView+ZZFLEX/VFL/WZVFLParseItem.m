//
//  WZVFLParseItem.m
//  Masonry
//
//  Created by 王文照 on 2020/7/1.
//

#import "WZVFLParseItem.h"

@implementation WZVFLParseItem

+ (instancetype)ParseItemWithVisualFormar:(NSString *)format metrics:(NSDictionary *)metrics views:(NSDictionary *)views options:(NSLayoutFormatOptions)options {
    WZVFLParseItem *item = [[WZVFLParseItem alloc] init];
    item.visualFormat = format;
    item.metrics = metrics;
    item.views = views;
    item.options = options;
    return item;
}

@end
