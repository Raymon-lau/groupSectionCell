//
//  UITextField+Masonry.h
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Masonry)

+(UITextField *)getTextFieldWithFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block;

/**
 *  以下六个是以字体区分
 *
 *
 *  @return UITextField
 */
+ (UITextField *)getTextFieldWithUltralightFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block;

+ (UITextField *)getTextFieldWithThinFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block;

+ (UITextField *)getTextFieldWithLightFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block;

+ (UITextField *)getTextFieldWithRegularFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block;

+ (UITextField *)getTextFieldWithMediumFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block;

+ (UITextField *)getTextFieldWithSemiboldFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block;

@end
