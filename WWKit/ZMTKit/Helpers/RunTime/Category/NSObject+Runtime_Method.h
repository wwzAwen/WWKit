//
//  NSObject+Runtime_Method.h
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Runtime_Method)
@property(nonatomic, strong, readonly) NSArray<NSString *> *methodList;

#pragma mark - <-- 添加 实例 方法 -->
- (void)addInstanceMethod:(SEL)selector i_block:(int(^)(void))block;

- (void)addInstanceMethod:(SEL)selector I_block:(NSInteger(^)(void))block;

- (void)addInstanceMethod:(SEL)selector f_block:(float(^)(void))block;

- (void)addInstanceMethod:(SEL)selector d_block:(double(^)(void))block;

- (void)addInstanceMethod:(SEL)selector b_block:(BOOL(^)(void))block;

- (void)addInstanceMethod:(SEL)selector o_block:(id _Nullable(^)(void))block;

- (void)addInstanceMethod:(SEL)selector v_block:(void(^)(void))block;



#pragma mark - <-- 添加 协议 方法 -->
@property(nonatomic, strong) id runtime_delegate;

- (void)addDelegateMethod:(SEL)selector i_block:(int(^)(void))block;

- (void)addDelegateMethod:(SEL)selector I_block:(NSInteger(^)(void))block;

- (void)addDelegateMethod:(SEL)selector f_block:(float(^)(void))block;

- (void)addDelegateMethod:(SEL)selector d_block:(double(^)(void))block;

- (void)addDelegateMethod:(SEL)selector b_block:(BOOL(^)(void))block;

- (void)addDelegateMethod:(SEL)selector o_block:(id _Nullable(^)(void))block;

- (void)addDelegateMethod:(SEL)selector v_block:(void(^)(void))block;



#pragma mark - <-- 添加 本类 公共方法 -->
+ (void)addPublicMethod:(SEL)selector i_block:(int(^)(void))block;

+ (void)addPublicMethod:(SEL)selector I_block:(NSInteger(^)(void))block;

+ (void)addPublicMethod:(SEL)selector f_block:(float(^)(void))block;

+ (void)addPublicMethod:(SEL)selector d_block:(double(^)(void))block;

+ (void)addPublicMethod:(SEL)selector b_block:(BOOL(^)(void))block;

+ (void)addPublicMethod:(SEL)selector o_block:(id _Nullable(^)(void))block;

+ (void)addPublicMethod:(SEL)selector v_block:(void(^)(void))block;



#pragma mark - <-- 添加 本类 公共类方法 -->
+ (void)addClassMethod:(SEL)selector i_block:(int(^)(void))block;

+ (void)addClassMethod:(SEL)selector I_block:(NSInteger(^)(void))block;

+ (void)addClassMethod:(SEL)selector f_block:(float(^)(void))block;

+ (void)addClassMethod:(SEL)selector d_block:(double(^)(void))block;

+ (void)addClassMethod:(SEL)selector b_block:(BOOL(^)(void))block;

+ (void)addClassMethod:(SEL)selector o_block:(id _Nullable(^)(void))block;

+ (void)addClassMethod:(SEL)selector v_block:(void(^)(void))block;



#pragma mark - <-- 交换实现方法-->
- (void)exchangeInstanceMethodWithOriginalSel:(SEL)originalSelector
                                  swizzledSel:(SEL)swizzledSelector;

+ (void)exchangeInstanceMethodWithOriginalSel:(SEL)originalSelector
                                  swizzledSel:(SEL)swizzledSelector;



#pragma mark - <-- 执行方法 -->
/// 执行super方法
- (void)performSuperSelector:(SEL)aSelector param:(id)param;
- (void)performSuperSelector:(SEL)aSelector param1:(id)param1 param2:(id)param2;
- (void)performSuperSelector:(SEL)aSelector param1:(id)param1 param2:(id)param2 param3:(id)param3;

@end

NS_ASSUME_NONNULL_END
