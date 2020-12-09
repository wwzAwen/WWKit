//
//  NSObject+ZMT.m
//  ZMTKit
//
//  Created by 王冠华 on 2019/12/4.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import "NSObject+ZMT.h"
#import <objc/runtime.h>
#import "WWDeallocTask.h"

@implementation NSObject (ZMT)

@end

static NSMutableDictionary *keyBuffer;  // 存储获取动态属性实际的key
@implementation NSObject (Association)

+ (void)load {
    keyBuffer = [NSMutableDictionary dictionary];
}

#pragma mark - # Public Methods
- (void)tt_setAssociatedObject:(id)object forKey:(NSString *)key association:(WWAssociation)association
{
    [self tt_setAssociatedObject:object forKey:key association:association isAtomic:NO];
}

- (void)tt_setAssociatedObject:(id)object forKey:(NSString *)key association:(WWAssociation)association isAtomic:(BOOL)isAtomic
{
    if (!key) {
        return;
    }
    const char *cKey = [keyBuffer[key] pointerValue];
    if (cKey == NULL) {
        cKey = key.UTF8String;
        keyBuffer[key] = [NSValue valueWithPointer:cKey];
    }
    if (association == WWAssociationAssign) {       // Assign
        objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_ASSIGN);
    }
    else if (association == WWAssociationStrong) {
        objc_setAssociatedObject(self, cKey, object, isAtomic ? OBJC_ASSOCIATION_RETAIN : OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    else if (association == WWAssociationCopy) {
        objc_setAssociatedObject(self, cKey, object, isAtomic ? OBJC_ASSOCIATION_COPY : OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    else if (association == WWAssociationWeak) {
        [self p_setWeakObject:object forKey:key];
    }
}

- (id)tt_associatedObjectForKey:(NSString *)key {
    const char *cKey = [keyBuffer[key] pointerValue];
    if (cKey) {
        return objc_getAssociatedObject(self, cKey);
    }
    return nil;
}

#pragma mark - # Private Methods
- (void)p_setWeakObject:(id)object forKey:(NSString *)key {
    const char *cKey = [keyBuffer[key] pointerValue];
    __weak typeof(self) weakSelf = self;
    
    id oldObj = objc_getAssociatedObject(self, cKey);
    [oldObj removeDeallocTaskForTarget:weakSelf key:key];
    
    objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_ASSIGN);
    [object addDeallocTask:^{
        objc_setAssociatedObject(weakSelf, cKey, nil, OBJC_ASSOCIATION_ASSIGN);
    } forTarget:weakSelf key:key];
}

@end

static const char kTask = '0';
@implementation NSObject (Dealloc)

- (void)addDeallocTask:(WWDeallocBlock)deallocTask forTarget:(id)target key:(NSString *)key
{
    [self.deallocTask addDeallocTask:deallocTask forTarget:target key:key];
}

- (void)removeDeallocTaskForTarget:(id)target key:(NSString *)key
{
    [self.deallocTask removeDeallocTaskForTarget:target key:key];
}

#pragma mark - # Getters
- (WWDeallocTask *)deallocTask
{
    WWDeallocTask *task = objc_getAssociatedObject(self, &kTask);
    if (!task) {
        task = [[WWDeallocTask alloc] init];
        objc_setAssociatedObject(self, &kTask, task, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return task;
}

@end
