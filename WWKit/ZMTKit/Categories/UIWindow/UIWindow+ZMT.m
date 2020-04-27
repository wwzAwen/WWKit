//
//  UIWindow+ZMT.m
//  ZMTKit
//
//  Created by 王文照 on 2019/12/2.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import "UIWindow+ZMT.h"

@implementation UIWindow (ZMT)

- (UIViewController*)topMostVC
{
    UIViewController *topController = [self rootViewController];
    
    //  Getting topMost ViewController
    while ([topController presentedViewController])    topController = [topController presentedViewController];
    
    //  Returning topMost ViewController
    return topController;
}

- (UIViewController*)currentVC
{
    UIViewController *currentViewController = [self topMostVC];
    
    while (([currentViewController isKindOfClass:[UINavigationController class]] &&
            [(UINavigationController*)currentViewController topViewController]) ||
           [currentViewController isKindOfClass:[UITabBarController class]]) {
        
        if ([currentViewController isKindOfClass:[UITabBarController class]]) {
            currentViewController = [(UITabBarController *)currentViewController selectedViewController];
        }
        currentViewController = [(UINavigationController*)currentViewController topViewController];
        
    }
    return currentViewController;
}
@end
