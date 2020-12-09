//
//  WWDeallocTask.h
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import <Foundation/Foundation.h>
#import "NSObject+ZMT.h"
NS_ASSUME_NONNULL_BEGIN

@interface WWDeallocTask : NSObject
- (void)addTask:(WWDeallocBlock)task forTarget:(id)target key:(NSString *)key;
- (void)removeTaskForTarget:(id)target key:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
