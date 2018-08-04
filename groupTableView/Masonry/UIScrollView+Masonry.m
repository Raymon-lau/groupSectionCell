//
//  UIScrollView+Masonry.m
//  KDLC
//
//  Created by koudailc on 16/12/16.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "UIScrollView+Masonry.h"

@implementation UIScrollView (Masonry)
+(UIScrollView *)getScrollViewWithColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIScrollView *view,MASConstraintMaker *make))block
{
  UIScrollView *view = [[UIScrollView alloc] init];
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

+(UIScrollView *)getScrollViewWithColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UIScrollView *view,MASConstraintMaker *make))block
{
  return [UIScrollView getScrollViewWithColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}
@end
