//
//  UIScrollView+Masonry.h
//  KDLC
//
//  Created by koudailc on 16/12/16.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface UIScrollView (Masonry)
/**
 *  实例化一个UIScrollView，省去每次都要写很多重复的代码
 *
 *  @param color  颜色
 *  @param superView 父view
 *  @param block     lyt设置约束布局的代码
 *
 *  @return UILabel
 */
+(UIScrollView *)getScrollViewWithColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIScrollView *view,MASConstraintMaker *make))block;
+(UIScrollView *)getScrollViewWithColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UIScrollView *view,MASConstraintMaker *make))block;
@end
