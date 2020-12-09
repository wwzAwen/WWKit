//
//  NSObject+AutoAssignment.h
//  Masonry
//
//  Created by 王文照 on 2020/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AutoAssignment)

@end

@interface UIImageView (AutoAssignment)
@property (nonatomic, strong) UIImage * placeHolderImage;
- (void)wz_setImageWithUrl:(NSString *)url placeHolderImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
