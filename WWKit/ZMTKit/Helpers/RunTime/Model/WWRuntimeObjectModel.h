//
//  WWRuntimeObjectModel.h
//  WWKit
//
//  Created by 王文照 on 2020/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#ifndef PROPERTY_TYPE
#define PROPERTY_TYPE
typedef NS_ENUM(NSUInteger, PropertyType) {
    PropertyType_NSObject,
    PropertyType_NSNumber,
    PropertyType_NSString,
    PropertyType_NSArray,
    PropertyType_NSDictionary,
    PropertyType_NSSet,
    
    PropertyType_Void,
    PropertyType_Id,
    PropertyType_Class,
    PropertyType_Sel,
    
    PropertyType_Int,
    PropertyType_UInt,
    PropertyType_Short,
    PropertyType_UShort,
    PropertyType_Long,
    PropertyType_ULong,
    PropertyType_LongLong,
    PropertyType_ULongLong,
    PropertyType_NSInteger,
    PropertyType_NSUInteger,
    PropertyType_Char,
    PropertyType_UChar,
    PropertyType_Chars,
    PropertyType_Float,
    PropertyType_Double,
    PropertyType_Bool,
};
#endif
@interface WWRuntimeObjectModel : NSObject

@property(nonatomic, copy)   NSString *name;
@property(nonatomic, strong) id value;
@property(nonatomic, assign) PropertyType type;
@property(nonatomic, copy)   NSString *className;
@end

NS_ASSUME_NONNULL_END
