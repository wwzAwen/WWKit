//
//  CALayer+ZMT.m
//  HaoXiangYin
//
//  Created by 王冠华 on 2019/8/17.
//  Copyright © 2019 zmeng. All rights reserved.
//

#import "CALayer+ZMT.h"

@implementation CALayer (ZMT)

- (void)setBorderUIColor:(UIColor *)borderUIColor {
    self.borderColor = borderUIColor.CGColor;
}

- (UIColor *)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

- (void)setShadowUIColor:(UIColor *)shadowUIColor {
    self.shadowColor = shadowUIColor.CGColor;
}

- (UIColor *)shadowUIColor {
    return [UIColor colorWithCGColor:self.shadowColor];
}



@end
