//
//  NSString+ZMT.h
//  ZMTKit
//
//  Created by 王文照 on 2019/12/2.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZMT)

///计算字符空间大小
- (CGSize)sizeWithStringFont:(UIFont *)font width:(NSInteger)width;
- (CGSize)sizeWithStringFont:(UIFont *)font width:(NSInteger)width height:(NSInteger)height;

///正则判断手机合法
- (BOOL)isValidateMobile;
///正则判断密码合法
- (BOOL)isValidatePwd;
///正则判断是否是中文
- (BOOL)isChinese;
///判断是否含有汉字
- (BOOL)includeChinese;
///判断时候是正确的身份证
- (BOOL)isValidateIDCard;
///md5加密
- (NSString *)md5HexDigest;
///正则获取链接
- (NSMutableArray *)matchWebLink;
///文字替换成***
-(NSString *)replaceStringWithAsteriskStartLocation:(NSInteger)startLocation lenght:(NSInteger)lenght;
///json字符串转 对应的id类型（数组、字典等）
- (id)jsonStringToId;
///复制到粘贴板
- (void)pasteboard;
///精度泄漏
- (NSString *)decimalNumberWithDoubleStrFormart:(NSString *)numberFormatter;
///判断是否是纯数字
- (BOOL)deptNumInputShouldNumber;
///数字格式化 4个一组
- (NSString *)formatCardNumber;
///格式化数字转正常号 － 去除4位间的空格
- (NSString *)bankNumToNormalNum;
/// 随机位数字符串 num - 位数
+ (NSString *)randomStrWithNum:(NSInteger)num;
/// 转url
+ (NSURL *)toUrl;
/// 汉字转拼音
- (NSString *)pinyin;
/// 汉字转首字母
- (NSString *)pinyinInitial;

/**
 double类型计算

 @param type + - * /
 @param numStr 做计算的数，也就是第二个数
 @param numberFormatter 是否格式化数据 例：原样保留前四位 0.####
 @return 计算结果
 */
- (NSString *)decimalNumberWithToCalculateType:(NSString *)type numStr:(NSString *)numStr numberFormatter:(NSString *)numberFormatter;

/**
 过滤敏感词
 */
- (NSString *)filterSensitiveWords;


/**
 返回正确的base64（服务返回的是经过处理的）
 */
- (NSString *)safeUrlBase64Decode;

/**
 上传经过处理的base64
 */
- (NSString *)safeUrlBase64Encode;
@end


NS_ASSUME_NONNULL_END
