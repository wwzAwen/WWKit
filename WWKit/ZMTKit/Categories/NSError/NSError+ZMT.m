//
//  NSError+ZMT.m
//  ZMTKit
//
//  Created by 王文照 on 2019/12/3.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import "NSError+ZMT.h"

@implementation NSError (ZMT)

- (NSString *)errorMsg {
    
    NSString *message = @"请检查网络后再试";
    if ( [self isKindOfClass:[NSError class]] ) {
        
        if ([[self domain] isEqualToString:@"ZTErrorDomain"]) {
            message = self.userInfo[@"msg"] ? : @"获取数据出错请稍后再试";
        } else if(self.code != 200) {
            NSString *errorDataKey = @"com.alamofire.serialization.response.error.data";
            if (kKeyInDic(self.userInfo, errorDataKey)) {
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:self.userInfo[errorDataKey]
                                                                           options:NSJSONReadingMutableContainers
                                                                             error:nil];
                message = dictionary[@"message"];
            } else if (kKeyInDic(self.userInfo, @"msg")) {
                message = self.userInfo[@"msg"];
            }
        }
    }
    return message;
}
@end
