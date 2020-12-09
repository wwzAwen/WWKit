//
//  NSObject+ZMT.h
//  ZMTKit
//
//  Created by 王冠华 on 2019/12/4.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZMT)

@end

typedef NS_ENUM(NSUInteger, WWAssociation) {
    WWAssociationAssign,
    WWAssociationStrong,
    WWAssociationCopy,
    WWAssociationWeak,
};
@interface NSObject (Association)
/**
 * 根据key添加动态属性，默认noatomic
 */
- (void)tt_setAssociatedObject:(id)object forKey:(NSString *)key association:(WWAssociation)association;

/**
 * 根据key添加动态属性
 */
- (void)tt_setAssociatedObject:(id)object forKey:(NSString *)key association:(WWAssociation)association isAtomic:(BOOL)isAtomic;

/**
 * 根据key获取动态属性
 */
- (id)tt_associatedObjectForKey:(NSString *)key;
@end

typedef void(^WWDeallocBlock)(void);

@interface NSObject (Dealloc)

- (void)addDeallocTask:(WWDeallocBlock)deallocTask forTarget:(id)target key:(NSString *)key;

- (void)removeDeallocTaskForTarget:(id)target key:(NSString *)key;

@end


NS_ASSUME_NONNULL_END
