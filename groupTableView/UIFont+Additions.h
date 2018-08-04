//
//  UIFont+Additions.h
//  KDLC
//
//  Created by 曹晓丽 on 2016/12/30.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

/**字体类型*/
typedef enum : NSUInteger {
  Ultralight,
  Thin,
  Light,
  DefaultFont,//默认Regular
  Regular,
  Medium,
  Semibold,
} CustomFontType;

@interface UIFont (Additions)

/**
 返回对应字体类型的font
 
 @param stringTypeName 字体类型枚举
 @param size 字体大小
 */
+ (UIFont *)kd_getCustomFontTypeWith:(CustomFontType)stringTypeName fontSize:(CGFloat)size;

//PingFangSC-Ultralight字体
+ (UIFont *)ultralightFontOfSize:(CGFloat)fontSize;

//PingFangSC-Thin字体
+ (UIFont *)thinFontOfSize:(CGFloat)fontSize;

//PingFangSC-Light字体
+ (UIFont *)lightFontOfSize:(CGFloat)fontSize;

//PingFangSC-Regular字体
+ (UIFont *)regularFontOfSize:(CGFloat)fontSize;

//PingFangSC-Medium字体
+ (UIFont *)mediumFontOfSize:(CGFloat)fontSize;

//PingFangSC-Semibold字体
+ (UIFont *)semiboldFontOfSize:(CGFloat)fontSize;

//AppleSDGothicNeo-Bold  数字  字体
+ (UIFont *)numberBoldFontOfSize:(CGFloat)fontSize;
//AppleSDGothicNeo-UltraLight  数字  字体
+ (UIFont *)numberUltraLightFontOfSize:(CGFloat)fontSize;
//AppleSDGothicNeo-Thin  数字  字体
+ (UIFont *)numberThinFontOfSize:(CGFloat)fontSize;
//AppleSDGothicNeo-Light  数字  字体
+ (UIFont *)numberLightFontOfSize:(CGFloat)fontSize;
//AppleSDGothicNeo-Regular  数字  字体
+ (UIFont *)numberRegularFontOfSize:(CGFloat)fontSize;
//AppleSDGothicNeo-Medium   数字  字体
+ (UIFont *)numberMediumFontOfSize:(CGFloat)fontSize;
//AppleSDGothicNeo-SemiBold   数字  字体
+ (UIFont *)numberSemiBoldFontOfSize:(CGFloat)fontSize;
@end
