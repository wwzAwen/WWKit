//
//  ZMTTools.m
//  ZMTKit
//
//  Created by 王冠华 on 2019/11/28.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import "ZMTTools.h"

@implementation ZMTTools

+ (CGRect)getStatusBarFrame {
    if (@available(iOS 13.0, *)) {
        // iOS 13  弃用keyWindow属性  从所有windowl数组中取
        UIWindow *keyWindow = [UIApplication sharedApplication].windows[0];
        return keyWindow.windowScene.statusBarManager.statusBarFrame;
    } else {
        return [UIApplication sharedApplication].statusBarFrame;
    }
}

@end
