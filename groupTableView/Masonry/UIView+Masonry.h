//
//  UIView+Masonry.h
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Masonry)

/**
 *  实例化一个UIView，省去每次都要写很多重复的代码
 *
 *  @param color  颜色
 *  @param superView 父view
 *  @param block     lyt设置约束布局的代码
 *
 *  @return UILabel
 */
+(UIView *)getViewWithColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIView *view,MASConstraintMaker *make))block;

+(UIView *)getViewWithColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UIView *view,MASConstraintMaker *make))block;

@end
