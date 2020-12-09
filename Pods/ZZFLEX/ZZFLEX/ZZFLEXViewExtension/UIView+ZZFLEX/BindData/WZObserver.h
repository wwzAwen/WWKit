//
//  WZObserver.h
//  Masonry
//
//  Created by 王文照 on 2020/7/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WZObserver : NSObject
- (void)bindDataWithModel:(__weak NSObject *)viewModel bindKeyPath:(NSString *)keyPath toPath:(NSString *)toPath;
@end

@interface NSObject (WZKvo)
- (WZObserver *)Observer;
@end

NS_ASSUME_NONNULL_END
