//
//  UILabel+Masonry.h
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Masonry)

/**
 创建label
 
 @param size 字体大小
 @param fontType 字体类型枚举
 @param textColor 字体颜色-id
 @param superView superView
 @param block block
 */
+(UILabel *)kd_getLabelWithFontSize:(NSInteger)size fontStyle:(CustomFontType)fontType textColor:(id)textColor superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

/**
 *  实例化一个UILabel，省去每次都要写很多重复的代码
 *
 *  @param size      fontsize，系统默认字体
 *  @param color    颜色色值，UIColor类型
 *  @param superView 父view
 *  @param block     masonrySet设置约束布局的代码
 *
 *  @return UILabel
 */
+(UILabel *)getLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

/**
 *  实例化一个UILabel，以下六个和上面的区别是以字体来区分的，省去每次都要写很多重复的代码
 *
 *  @return UILabel
 */
+(UILabel *)getLabelWithUltralightFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithThinFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithLightFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithRegularFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithMediumFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithSemiBoldFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

/**
 *  实例化一个UILabel，省去每次都要写很多重复的代码
 *
 *  @param size      fontsize，系统默认字体
 *  @param colorHex  颜色色值，16进制，前面要加#
 *  @param superView 父view
 *  @param block     masonrySet设置约束布局的代码
 *
 *  @return UILabel
 */
+(UILabel *)getLabelWithFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

/**
 *  实例化一个UILabel，以下六个和上面这个的区别是以字体来区分的，省去每次都要写很多重复的代码
 *
 *  @return UILabel
 */
+(UILabel *)getLabelWithUltralightFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithThinFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithLightFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithRegularFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithMediumFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithSemiBoldFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;


+(UILabel *)getLabelWithFont:(UIFont *)font textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

+(UILabel *)getLabelWithFont:(UIFont *)font textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;

@end
