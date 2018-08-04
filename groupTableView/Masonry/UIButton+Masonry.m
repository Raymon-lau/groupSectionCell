//
//  UIButton+Masonry.m
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import "UIButton+Masonry.h"

@implementation UIButton (Masonry)

+(UIButton *)kd_getButtonWithFontSize:(NSInteger)size fontType:(CustomFontType)type titleColor:(id)titleColor backGroundColor:(id)bgcolor superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block {
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  
  if ([titleColor isKindOfClass:[NSString class]]) {
    [btn setTitleColor:[UIColor colorWithHex:titleColor] forState:UIControlStateNormal];
  } else if ([titleColor isKindOfClass:[UIColor class]]) {
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
  }
  if ([bgcolor isKindOfClass:[NSString class]]) {
    btn.backgroundColor = [UIColor colorWithHex:bgcolor];
  } else if ([bgcolor isKindOfClass:[UIColor class]]) {
    btn.backgroundColor = bgcolor;
  }
  btn.titleLabel.font = [UIFont kd_getCustomFontTypeWith:type fontSize:size];
  btn.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:btn];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(btn,make);
    }
  }];
  return btn;
}

+(UIButton *)kd_getButtonWithImageName:(NSString *)imageName superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block {
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  btn.backgroundColor = [UIColor whiteColor];
  [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
  btn.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:btn];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(btn,make);
    }
  }];
  return btn;
}

+(UIButton *)getButtonWithFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
    return [UIButton getButtonWithFontSize:size TextColorHex:colorHex backGroundColor2:[UIColor colorWithHex:color] superView:superView masonrySet:block];
}

+(UIButton *)getButtonWithUltralightFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  return [UIButton getButtonWithUltralightFontSize:size TextColorHex:colorHex backGroundColor2:[UIColor colorWithHex:color] superView:superView masonrySet:block];
}

+(UIButton *)getButtonWithThinFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  return [UIButton getButtonWithThinFontSize:size TextColorHex:colorHex backGroundColor2:[UIColor colorWithHex:color] superView:superView masonrySet:block];
}

+(UIButton *)getButtonWithLightFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  return [UIButton getButtonWithLightFontSize:size TextColorHex:colorHex backGroundColor2:[UIColor colorWithHex:color] superView:superView masonrySet:block];
}

+(UIButton *)getButtonWithRegularFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  return [UIButton getButtonWithRegularFontSize:size TextColorHex:colorHex backGroundColor2:[UIColor colorWithHex:color] superView:superView masonrySet:block];
}

+(UIButton *)getButtonWithMediumFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  return [UIButton getButtonWithMediumFontSize:size TextColorHex:colorHex backGroundColor2:[UIColor colorWithHex:color] superView:superView masonrySet:block];
}

+(UIButton *)getButtonWithSemiBoldFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  return [UIButton getButtonWithSemiBoldFontSize:size TextColorHex:colorHex backGroundColor2:[UIColor colorWithHex:color] superView:superView masonrySet:block];
}

+(UIButton *)getButtonWithFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:size];
    [btn setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
    [btn setBackgroundColor:color];
    
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:btn];

    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(btn,make);
        }
    }];
    
    return btn;
}

+(UIButton *)getButtonWithUltralightFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  if (IOS9) {
    btn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Ultralight" size:size];
  } else {
    btn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:size];
  }
  [btn setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
  [btn setBackgroundColor:color];
  
  btn.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:btn];

  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(btn,make);
    }
  }];
  
  return btn;
}

+(UIButton *)getButtonWithThinFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  if (IOS9) {
    btn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Thin" size:size];
  } else {
    btn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:size];
  }
  [btn setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
  [btn setBackgroundColor:color];
  
  btn.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:btn];

  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(btn,make);
    }
  }];
  
  return btn;
}

+(UIButton *)getButtonWithLightFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  if (IOS9) {
    btn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:size];
  } else {
    btn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:size];
  }
  [btn setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
  [btn setBackgroundColor:color];
  
  btn.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:btn];

  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(btn,make);
    }
  }];
  
  return btn;
}

+(UIButton *)getButtonWithRegularFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  if (IOS9) {
    btn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
  } else {
    btn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:size];
  }
  [btn setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
  [btn setBackgroundColor:color];
  
  btn.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:btn];

  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(btn,make);
    }
  }];
  
  return btn;
}

+(UIButton *)getButtonWithMediumFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  if (IOS9) {
    btn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
  } else {
    btn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:size];
  }
  [btn setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
  [btn setBackgroundColor:color];
  
  btn.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:btn];

  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(btn,make);
    }
  }];
  
  return btn;
}

+(UIButton *)getButtonWithSemiBoldFontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  if (IOS9) {
    btn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
  } else {
    btn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:size];
  }

  btn.titleLabel.font = [UIFont systemFontOfSize:size];
  [btn setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
  [btn setBackgroundColor:color];
  
  btn.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:btn];

  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(btn,make);
    }
  }];
  
  return btn;
}

+ (UIButton *)getCustomButtonWithTitleEdge:(UIEdgeInsets)titleEdge imageEdge:(UIEdgeInsets)imageEdge imageDirection:(ImageEdgeDirection)imageDirection FontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block{
  return [UIButton getCustomButtonWithTitleEdge:titleEdge imageEdge:imageEdge imageDirection:imageDirection FontSize:size TextColorHex:colorHex backGroundColor2:[UIColor colorWithHex:color] superView:superView masonrySet:block];
}

+ (UIButton *)getCustomButtonWithTitleEdge:(UIEdgeInsets)titleEdge imageEdge:(UIEdgeInsets)imageEdge imageDirection:(ImageEdgeDirection)imageDirection FontSize:(NSInteger)size TextColorHex:(NSString *)colorHex backGroundColor2:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block{
  KDCustombutton *btn = [KDCustombutton buttonWithType:UIButtonTypeCustom];
  btn.titleLabel.font = [UIFont systemFontOfSize:size];
  btn.titleEdge = titleEdge;
  btn.imageEdge = imageEdge;
  btn.imageDirection = imageDirection;
  [btn setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
  [btn setBackgroundColor:color];
  btn.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:btn];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(btn,make);
    }
  }];
  return btn;
}

@end
