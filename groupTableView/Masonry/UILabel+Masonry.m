//
//  UILabel+Masonry.m
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import "UILabel+Masonry.h"

@implementation UILabel (Masonry)

+(UILabel *)kd_getLabelWithFontSize:(NSInteger)size fontStyle:(CustomFontType)fontType textColor:(id)textColor superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  UILabel *label = [[UILabel alloc] init];
  label.font = [UIFont kd_getCustomFontTypeWith:fontType fontSize:size];
  if ([textColor isKindOfClass:[NSString class]]) {
    label.textColor = [UIColor colorWithHex:textColor];
  } else if ([textColor isKindOfClass:[UIColor class]]) {
    label.textColor = textColor;
  }
  
  label.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:label];
  
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(label,make);
    }
  }];
  return label;
}

+(UILabel *)getLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(label,make);
        }
    }];
    return label;
}

+(UILabel *)getLabelWithUltralightFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  UILabel *label = [[UILabel alloc] init];
  if (IOS9) {
    label.font = [UIFont fontWithName:@"PingFangSC-Ultralight" size:size];
  } else {
    label.font = [UIFont fontWithName:@"Helvetica-Light" size:size];
  }
  label.textColor = color;
  label.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:label];
  
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(label,make);
    }
  }];
  return label;
}

+(UILabel *)getLabelWithThinFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  UILabel *label = [[UILabel alloc] init];
  if (IOS9) {
    label.font = [UIFont fontWithName:@"PingFangSC-Thin" size:size];
  } else {
    label.font = [UIFont fontWithName:@"Helvetica-Light" size:size];
  }
  label.textColor = color;
  label.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:label];
  
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(label,make);
    }
  }];
  return label;
}

+(UILabel *)getLabelWithLightFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  UILabel *label = [[UILabel alloc] init];
  if (IOS9) {
    label.font = [UIFont fontWithName:@"PingFangSC-Light" size:size];
  } else {
    label.font = [UIFont fontWithName:@"Helvetica" size:size];
  }
  label.textColor = color;
  label.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:label];
  
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(label,make);
    }
  }];
  return label;
}

+(UILabel *)getLabelWithRegularFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  UILabel *label = [[UILabel alloc] init];
  if (IOS9) {
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
  } else {
    label.font = [UIFont fontWithName:@"Helvetica" size:size];
  }
  label.textColor = color;
  label.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:label];
  
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(label,make);
    }
  }];
  return label;
}

+(UILabel *)getLabelWithMediumFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  UILabel *label = [[UILabel alloc] init];
  if (IOS9) {
    label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
  } else {
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:size];
  }
  label.textColor = color;
  label.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:label];
  
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(label,make);
    }
  }];
  return label;
}

+(UILabel *)getLabelWithSemiBoldFontSize:(NSInteger)size textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  UILabel *label = [[UILabel alloc] init];
  if (IOS9) {
    label.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
  } else {
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:size];
  }
  label.textColor = color;
  label.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:label];
  
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(label,make);
    }
  }];
  return label;
}


+(UILabel *)getLabelWithFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  return [UILabel getLabelWithFontSize:size textColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}

+(UILabel *)getLabelWithUltralightFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  return [UILabel getLabelWithUltralightFontSize:size textColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}

+(UILabel *)getLabelWithThinFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  return [UILabel getLabelWithThinFontSize:size textColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}

+(UILabel *)getLabelWithLightFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  return [UILabel getLabelWithLightFontSize:size textColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}

+(UILabel *)getLabelWithRegularFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  return [UILabel getLabelWithRegularFontSize:size textColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}

+(UILabel *)getLabelWithMediumFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  return [UILabel getLabelWithMediumFontSize:size textColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}

+(UILabel *)getLabelWithSemiBoldFontSize:(NSInteger)size textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  return [UILabel getLabelWithSemiBoldFontSize:size textColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}

+(UILabel *)getLabelWithFont:(UIFont *)font textColor:(UIColor *)color superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  UILabel *label = [[UILabel alloc] init];
  label.font = font;
  label.textColor = color;
  label.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:label];
  
  [label mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(label,make);
    }
  }];
  return label;
}

+(UILabel *)getLabelWithFont:(UIFont *)font textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block
{
  return [UILabel getLabelWithFont:font textColor:[UIColor colorWithHex:colorHex] superView:superView masonrySet:block];
}
@end
