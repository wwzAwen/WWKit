//
//  NSObject+Runtime_Class.m
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import "NSObject+Runtime_Class.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime_Class)
#pragma mark - <-- 获取信息 -->
- (Class)getClass {
    return [self class];
}

+ (Class)getClass {
    return [self class];
}

- (Class)getMetaClass {
    return object_getClass([self class]);
}

+ (Class)getMetaClass {
    return object_getClass([self class]);
}

- (NSString *)getClassName {
    return NSStringFromClass([self class]);
}

+ (NSString *)getClassName {
    return NSStringFromClass([self class]);
}


#pragma mark - <-- Method -->
- (void)changeToClass:(Class)aClass {
    object_setClass(self, aClass);
}
@end
