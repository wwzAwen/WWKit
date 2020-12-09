//
//  NSObject+AutoAssignment.m
//  Masonry
//
//  Created by 王文照 on 2020/7/13.
//

#import "NSObject+AutoAssignment.h"
#if __has_include(<SDWebImage/UIImageView+WebCache.h>)
#import <SDWebImage/UIImageView+WebCache.h>
#endif
#import <objc/runtime.h>
@implementation NSObject (AutoAssignment)

+ (void)load {
    Method originValueKey = class_getInstanceMethod(NSObject.class, @selector(setValue:forKey:));
    Method newValueKey = class_getInstanceMethod(NSObject.class, @selector(WZ_SetValue:forKey:));
    method_exchangeImplementations(originValueKey, newValueKey);
    
    Method originValueUndefineKey = class_getInstanceMethod(NSObject.class, @selector(setValue:forUndefinedKey:));
    Method newValueUndefineKey = class_getInstanceMethod(NSObject.class, @selector(WZ_SetValue:forUndefinedKey:));
    method_exchangeImplementations(originValueUndefineKey, newValueUndefineKey);

}

- (void)WZ_SetValue:(id)value forKey:(NSString *)key  {
    
    if ([self respondsToSelector:@selector(WZ_SetValue:forKey:)]) {
        [self WZ_SetValue:value forKey:key];
    }
}

- (void)WZ_SetValue:(id)value forUndefinedKey:(NSString *)key {
//    NSAssert(![self respondsToSelector:@selector(WZ_SetValue:forUndefinedKey:)], @"当前 key 不存在");
    if ([self respondsToSelector:@selector(WZ_SetValue:forUndefinedKey:)]) {
        [self WZ_SetValue:value forUndefinedKey:key];
    }
}

@end


@implementation UIImageView (AutoAssignment)

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"image"]) {
        if ([value isKindOfClass:NSString.class]) {
            NSString *imageStr = (NSString *)value;
            if ([imageStr hasPrefix:@"http"]) {
                [self wz_setImageWithUrl:imageStr placeHolderImage:self.placeHolderImage];
            } else {
                self.image = [UIImage imageNamed:imageStr];
            }
        } else if ([value isKindOfClass:UIImage.class]) {
            self.image = value;
        }
        if (!self.image) {
            self.image = self.placeHolderImage;
        }
        return;
    }
    [super setValue:value forKey:key];
}

- (void)wz_setImageWithUrl:(NSString *)url placeHolderImage:(UIImage *)image {
    self.placeHolderImage = image;
    #if __has_include(<SDWebImage/UIImageView+WebCache.h>)
        [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:image];
    #endif
}

#define kPlaceHolderImage @"placeHolderImage"

- (void)setPlaceHolderImage:(UIImage *)placeHolderImage {
    if (placeHolderImage) {
        objc_setAssociatedObject(self, kPlaceHolderImage, placeHolderImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (UIImage *)placeHolderImage {
    return objc_getAssociatedObject(self, kPlaceHolderImage);
}

@end
