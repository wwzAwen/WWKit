//
//  NSString+ZMT.m
//  ZMTKit
//
//  Created by 王文照 on 2019/12/2.
//  Copyright © 2019 ZMT. All rights reserved.
//

#import "NSString+ZMT.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (ZMT)

#pragma mark --计算字符空间大小
- (CGSize)sizeWithStringFont:(UIFont *)font width:(NSInteger)width
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)//显示的最大容量
                                       options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading //描述字符串的附加参数
                                    attributes:@{NSFontAttributeName: font}//描述字符串的参数
                                       context:nil];//上下文
                                                    //返回值
    rect.size.height = ceilf(rect.size.height);
    return rect.size;
}




- (CGSize)sizeWithStringFont:(UIFont *)font width:(NSInteger)width height:(NSInteger)height
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, height)//显示的最大容量
                                       options: NSStringDrawingUsesLineFragmentOrigin //描述字符串的附加参数
                                    attributes:@{NSFontAttributeName: font}//描述字符串的参数
                                       context:nil];//上下文
                                                    //返回值
    rect.size.height = ceilf(rect.size.height);
    return rect.size;
}


#pragma mark - 正则判断
-(BOOL)isValidateMobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
//    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    return [phoneTest evaluateWithObject:self];
    
    //重新修改规则 11位 1开头
    if (self.length == 11 && [self hasPrefix:@"1"]) {
        return YES;
    }else
        return NO;
}

- (BOOL)isChinese
{
    NSString *phoneRegex = @"^[\u4e00-\u9fa5]+$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)includeChinese
{
    for(int i=0; i< [self length];i++)
    {
        int a =[self characterAtIndex:i];
        if( a >0x4e00&& a <0x9fff){
            return YES;
        }
    }
    return NO;
}

- (BOOL)isValidatePwd
{
//    [0-9a-zA-Z]{4,23}
//密码只是是数字和字母，长度6-12
    NSString *phoneRegex = @"[0-9a-zA-Z]{6,20}";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [pwdTest evaluateWithObject:self];
}

//md5加密
- (NSString *)md5HexDigest

{
    
    const char *original_str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        
        [hash appendFormat:@"%02x", result[i]];
    
    return [hash uppercaseString];
}

//正则获取链接
- (NSMutableArray *)matchWebLink{
    
    // NSLog(@"go here? go here? go here ?");
    
    NSMutableArray *linkArr = [NSMutableArray arrayWithCapacity:0];
    
    NSRegularExpression*regular=[[NSRegularExpression alloc]initWithPattern:@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)" options:NSRegularExpressionDotMatchesLineSeparators|NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray* array=[regular matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    for (int i=0; i<array.count; i++) {
        NSTextCheckingResult *result = array[i];
        NSString *string;
        if (i==0) {
            string = [self substringToIndex:result.range.location];
            if (string.length > 0) {
                [linkArr addObject:@{@"text":string}];
            }
            
        }else
        {
            NSTextCheckingResult *temoResult = array[i-1];
            string = [self substringWithRange:NSMakeRange(temoResult.range.location+temoResult.range.length, result.range.location-temoResult.range.location-temoResult.range.length)];
            [linkArr addObject:@{@"text":string}];
            
            
        }
        
        string = [self substringWithRange:result.range];
        [linkArr addObject:@{@"link":string}];
        
        if (i == array.count-1)
        {
            string = [self substringFromIndex:result.range.location+result.range.length];
            if (string.length > 0) {
                [linkArr addObject:@{@"text":string}];
            }
        }
        
    }
    if (array.count == 0) {
        [linkArr addObject:@{@"text":self}];
    }
    return linkArr;
    
}

//文字替换成***
-(NSString *)replaceStringWithAsteriskStartLocation:(NSInteger)startLocation lenght:(NSInteger)lenght
{
    NSString *newStr = self;
    for (int i = 0; i < lenght; i++) {
        NSRange range = NSMakeRange(startLocation, 1);
        newStr = [newStr stringByReplacingCharactersInRange:range withString:@"*"];
        startLocation ++;
    }
    return newStr;
}

- (BOOL)isValidateIDCard
{
    NSString *IDCard = @"^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$";
    NSPredicate *IDCardTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",IDCard];
    return [IDCardTest evaluateWithObject:self];
}

- (id)jsonStringToId
{
    if (self.length == 0) {
        return nil;
    }
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id obj = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return obj;
}

- (void)pasteboard
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self;
}

- (NSString *)decimalNumberWithDoubleStrFormart:(NSString *)numberFormatter{
    double conversionValue = [self doubleValue];
    NSString *doubleString = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    if (numberFormatter) {
        NSNumber *number = [NSNumber numberWithDouble:[decNumber doubleValue]];
        NSNumberFormatter *format = [[NSNumberFormatter alloc]init];
        format.roundingMode = NSNumberFormatterRoundFloor;
        [format setPositiveFormat:numberFormatter];
        return [format stringFromNumber:number];
    }
    return [decNumber stringValue];
}

- (NSString *)decimalNumberWithToCalculateType:(NSString *)type numStr:(NSString *)numStr numberFormatter:(NSString *)numberFormatter
{
    NSDecimalNumber *decNumber1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decNumber2 = [NSDecimalNumber decimalNumberWithString:numStr];
    NSDecimalNumber *decNumber;
    if ([type isEqualToString:@"+"]) {
        decNumber = [decNumber1 decimalNumberByAdding:decNumber2];
    }else if ([type isEqualToString:@"-"])
    {
        decNumber = [decNumber1 decimalNumberBySubtracting:decNumber2];
    }else if ([type isEqualToString:@"*"])
    {
        decNumber = [decNumber1 decimalNumberByMultiplyingBy:decNumber2];
    }else if ([type isEqualToString:@"/"])
    {
        decNumber = [decNumber1 decimalNumberByDividingBy:decNumber2];
    }
    if (numberFormatter) {
        NSNumber *number = [NSNumber numberWithDouble:[decNumber doubleValue]];
        NSNumberFormatter *format = [[NSNumberFormatter alloc]init];
        format.roundingMode = NSNumberFormatterRoundFloor;
        [format setPositiveFormat:numberFormatter];
        return [format stringFromNumber:number];
    }
    return [decNumber stringValue];
}

- (BOOL)deptNumInputShouldNumber
{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

- (NSString *)formatCardNumber {
    NSString *new = @"";
    NSString *old = self;
    while (old.length > 4) {
        new = [new stringByAppendingString:[old substringToIndex:4]];
        new = [new stringByAppendingString:@" "];
        old = [old substringFromIndex:4];
    }
    if (old.length > 0) {
        if (new.length > 0) {
            new = [new stringByAppendingString:@" "];
        }
        new = [new stringByAppendingString:old];
    }
    return new;
}

-(NSString *)bankNumToNormalNum
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)filterSensitiveWords
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"SensitiveWords" ofType:@"txt"];
    NSString *str= [NSString stringWithContentsOfFile:plistPath encoding:NSUTF8StringEncoding error:nil];
    NSArray *commentPlaceholderArr = [str componentsSeparatedByString:@"\n"];
    NSString *tempStr = self;
    for (NSString *str in commentPlaceholderArr) {
        if ([self rangeOfString:str].length > 0) {
            tempStr = [tempStr stringByReplacingOccurrencesOfString:str withString:@"***" options:NSCaseInsensitiveSearch range:NSMakeRange(0, self.length)];
        }
    }
    return tempStr;
}

- (NSString *)safeUrlBase64Decode
{
    // '-' -> '+'
    // '_' -> '/'
    // 不足4倍长度，补'='
    NSMutableString * base64Str = [[NSMutableString alloc]initWithString:self];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    NSInteger mod4 = base64Str.length % 4;
    if(mod4 > 0)
        [base64Str appendString:[@"====" substringToIndex:(4-mod4)]];
    return base64Str;
    
}

- (NSString *)safeUrlBase64Encode
{
    // '+' -> '-'
    // '/' -> '_'
    // '=' -> ''
    NSMutableString * base64Str = [[NSMutableString alloc]initWithString:self];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    [base64Str replaceOccurrencesOfString:@"=" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, base64Str.length)];
    return base64Str;
    
}

+ (NSString *)randomStrWithNum:(NSInteger)num {
    
    char data[num];
    for (int x=0;x < num;data[x++] = (char)('A' + (arc4random_uniform(26))));
    NSString *randomStr = [[NSString alloc] initWithBytes:data length:num encoding:NSUTF8StringEncoding];
    NSString *string = [NSString stringWithFormat:@"%@",randomStr];
    return string;
}

+ (NSString *)transform:(NSString *)chinese {
    if (!chinese) return @"";
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    return [[pinyin stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString];
}

@end

