//
//  WWDeallocTask.m
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import "WWDeallocTask.h"

#pragma mark - ## WWDeallocTaskItem
@interface WWDeallocTaskItem : NSObject

@property (nonatomic, weak, readonly) id target;
@property (nonatomic, copy, readonly) NSString *key;
@property (nonatomic, copy, readonly) WWDeallocBlock task;

- (instancetype)initWithTarget:(id)target key:(NSString *)key task:(WWDeallocBlock)task;

@end

@implementation WWDeallocTaskItem

- (instancetype)initWithTarget:(id)target key:(NSString *)key task:(WWDeallocBlock)task
{
    self = [super init];
    if (self) {
        _target = target;
        _key = key;
        _task = [task copy];
    }
    return self;
}

- (BOOL)isEqual:(WWDeallocTaskItem *)object
{
    if (object == self) {
        return YES;
    }
    else if ([object isKindOfClass:[self class]] && [object.target isEqual:self.target] && [object.key isEqualToString:self.key]) {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash
{
    return ([self.target hash] + self.key.hash) / 2;
}

@end

#pragma mark - ## WWDeallocTask
@interface WWDeallocTask ()

@property (nonatomic, strong) NSMutableSet<WWDeallocTaskItem *> *taskSet;

@end

@implementation WWDeallocTask

- (id)init
{
    if (self = [super init]) {
        self.taskSet = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [self.taskSet enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(WWDeallocTaskItem *obj, BOOL *stop) {
        obj.task ? obj.task() : nil;
    }];
}

#pragma mark - # Public Methods
- (void)addTask:(WWDeallocBlock)task forTarget:(id)target key:(NSString *)key
{
    WWDeallocTaskItem *taskItem = [[WWDeallocTaskItem alloc] initWithTarget:target key:key task:task];
    if ([self.taskSet containsObject:taskItem]) {
        [self.taskSet removeObject:taskItem];
    }
    [self.taskSet addObject:taskItem];
}

- (void)removeTaskForTarget:(id)target key:(NSString *)key
{
    WWDeallocTaskItem *taskItem = [[WWDeallocTaskItem alloc] initWithTarget:target key:key task:nil];
    [self.taskSet removeObject:taskItem];
}


@end
