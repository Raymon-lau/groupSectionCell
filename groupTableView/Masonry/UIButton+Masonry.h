//
//  UIButton+Masonry.h
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDCustombutton.h"
#import "UIFont+Additions.h"

@interface UIButton (Masonry)

/**
 创建button-无图片
 
 @param size 按钮字体大小
 @param type 按钮字体类型
 @param titleColor 按钮字体颜色
 @param bgcolor 按钮背景颜色
 @param superView 按钮的父视图
 @param block masonry布局block
 */
+(UIButton *)kd_getButtonWithFontSize:(NSInteger)size fontType:(CustomFontType)type titleColor:(id)titleColor backGroundColor:(id)bgcolor superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;


/**
 创建按钮-只有图片
 
 @param imageName 图片名称
 @param superView 按钮父视图
 @param block masonry布局block
 */
+(UIButton *)kd_getButtonWithImageName:(NSString *)imageName superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

/**
 *  获取一个button
 *
 *  @param size             title的fontsize
 *  @param colorHex         title的色值，16进制，前面加#
 *  @param color  背景色
 *  @param superView        父view
 *  @param block            lyt设置约束布局的代码
 *
 *  @return UIButton
 */
+(UIButton *)getButtonWithFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

/**
 *  以下六个分别是六个字体
 *
 *  @return UIButton
 */
+(UIButton *)getButtonWithUltralightFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithThinFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithLightFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithRegularFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithMediumFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithSemiBoldFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;


+(UIButton *)getButtonWithFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

/**
 *  获取一个自定义放置图片和title的button
 *
 *  @param titleEdge      用于设置title的frame
 *  @param imageEdge      用于设置image的frame
 *  @param imageDirection 设置image的frame的方向
 *  @param size             title的fontsize
 *  @param colorHex         title的色值，16进制，前面加#
 *  @param color  背景色
 *  @param superView        父view
 *  @param block            lyt设置约束布局的代码
 *
 *  @return UIButton
 */
+(UIButton *)getCustomButtonWithTitleEdge:(UIEdgeInsets)titleEdge imageEdge:(UIEdgeInsets)imageEdge imageDirection:(ImageEdgeDirection)imageDirection FontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

/**
 *  以下六个分别是六个字体
 *
 *  @return UIButton
 */
+(UIButton *)getButtonWithUltralightFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithThinFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithLightFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithRegularFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithMediumFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

+(UIButton *)getButtonWithSemiBoldFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;


+(UIButton *)getCustomButtonWithTitleEdge:(UIEdgeInsets)titleEdge imageEdge:(UIEdgeInsets)imageEdge imageDirection:(ImageEdgeDirection)imageDirection FontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;


@end
