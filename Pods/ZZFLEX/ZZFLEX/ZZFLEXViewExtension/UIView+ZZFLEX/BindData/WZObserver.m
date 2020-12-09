//
//  WZObserver.m
//  Masonry
//
//  Created by 王文照 on 2020/7/13.
//

#import "WZObserver.h"
#import <objc/runtime.h>

@interface WZObserver ()
@property (nonatomic, weak)   id owner;
@property (nonatomic, strong) NSMutableArray *contexts;
@end

@implementation WZObserver

- (instancetype)init {
    if (self = [super init]) {
        self.contexts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)bindDataWithModel:(__weak NSObject *)viewModel bindKeyPath:(NSString *)keyPath toPath:(NSString *)toPath {
    NSAssert(viewModel && keyPath.length && toPath.length && self.owner, @"参数错误，请检查");
//    NSAssert([viewModel valueForKeyPath:keyPath], @"viewModel keyPath 有误");
    if (viewModel && keyPath.length && toPath.length) {
        NSDictionary *context = @{
            @"keyPath" : keyPath,
            @"toPath"  : toPath
        };
        @try {
            [viewModel addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:(void *)context];
            [self.contexts addObject:context];
        } @catch (NSException *exception) {
            
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSDictionary *info = (__bridge NSDictionary *)context;
    NSString * toPath = info[@"toPath"];
    if ([self.owner respondsToSelector:@selector(setValue:forKey:)]) {
        if (toPath) {
            @try {
                id changed = [change valueForKey:NSKeyValueChangeNewKey];
                [self.owner setValue:changed forKey:toPath];
            } @catch (NSException *exception) {
                
            }
        }
    }
}

- (void)dealloc {
    if (self.contexts) {
        [self.contexts removeAllObjects];
    }
}

@end

@implementation NSObject (WZKvo)
#define kWZObserver @"WZObserver"
- (WZObserver *)Observer {
    WZObserver *kvo = objc_getAssociatedObject(self, kWZObserver);
    if (!kvo) {
        kvo = [[WZObserver alloc] init];
        kvo.owner = self;
        objc_setAssociatedObject(self, kWZObserver, kvo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return kvo;
}

@end

