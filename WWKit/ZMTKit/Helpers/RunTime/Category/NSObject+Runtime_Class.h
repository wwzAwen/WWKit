//
//  NSObject+Runtime_Class.h
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Runtime_Class)
#pragma mark - <-- 获取信息 -->
/// 获取本类
- (Class)getClass;

/// 获取本类
+ (Class)getClass;


/// 获取元类
- (Class)getMetaClass;

/// 获取元类
+ (Class)getMetaClass;


///获取本类的类名
- (NSString *)getClassName;

///获取本类的类名
+ (NSString *)getClassName;


#pragma mark - <-- Method -->
- (void)changeToClass:(Class)aClass;
@end

NS_ASSUME_NONNULL_END
