//
//  UIView+Masonry.m
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import "UIView+Masonry.h"

@implementation UIView (Masonry)

+(UIView *)getViewWithColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIView *view,MASConstraintMaker *make))block
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(view,make);
        }
    }];
    return view;
}

+(UIView *)getViewWithColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UIView *view,MASConstraintMaker *make))block
{
    return [UIView getViewWithColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}

@end
