//
//  WWRunTime.h
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WWRunTime : NSObject
#pragma mark - <-- Class -->
+ (Class)newSubClassWithName:(NSString *)subClassName base:(Class)baseClass;

+ (void)deleteClass:(Class)aClass;

+ (void)deleteClassWithName:(NSString *)className;


#pragma mark - <-- Method -->
+ (const char *)getMethodTypeWithProtocol:(Protocol *)protocol
                                 selector:(SEL)selector
                               isRequired:(BOOL)isRequiredMethod
                         isInstanceMethod:(BOOL)isInstanceMethod;

+ (const char *)getMethodTypeWithClass:(Class)aClass
                              selector:(SEL)selector
                      isInstanceMethod:(BOOL)isInstanceMethod;

+ (void)exchangeInstanceMethodWithOriginalClass:(Class)oClass
                                    originalSel:(SEL)originalSelector
                                  swizzledClass:(Class)sClass
                                    swizzledSel:(SEL)swizzledSelector;

+ (SEL)convertGetSelFromSetSel:(SEL)setSel;

+ (NSString *)convertGetNameFromSetName:(NSString *)setName;

#pragma mark - <-- Var -->

@end

NS_ASSUME_NONNULL_END
