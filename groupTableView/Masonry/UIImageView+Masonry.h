//
//  UIImageView+Masonry.h
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Masonry)

/**
 *  实例化一个UIImageView，省去每次都要写很多重复的代码
 *
 *  @param imageName 图片名
 *  @param superView 父view
 *  @param block     lyt设置约束布局的代码
 *
 *  @return UIImageView
 */
+(UIImageView *)getImageViewWithImageName:(NSString *)imageName superView:(UIView *)superView masonrySet:(void (^)(UIImageView *view,MASConstraintMaker *make))block;

@end
