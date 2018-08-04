//
//  UITextField+Masonry.m
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import "UITextField+Masonry.h"

@implementation UITextField (Masonry)

+ (UITextField *)getTextFieldWithFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block
{
    UITextField *textfield = [[UITextField alloc] init];
    textfield.font = [UIFont systemFontOfSize:size];
    textfield.textColor = [UIColor colorWithHex:colorHex];
    textfield.placeholder = placeHolder;
    textfield.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:textfield];
    
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(textfield,make);
        }
    }];
    
    return textfield;
}

+ (UITextField *)getTextFieldWithUltralightFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block
{
  UITextField *textfield = [[UITextField alloc] init];
  if (IOS9) {
    textfield.font = [UIFont fontWithName:@"PingFangSC-Ultralight" size:size];
  } else {
    textfield.font = [UIFont fontWithName:@"Helvetica-Light" size:size];
  }
  textfield.textColor = [UIColor colorWithHex:colorHex];
  textfield.placeholder = placeHolder;
  textfield.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:textfield];
  
  [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(textfield,make);
    }
  }];
  
  return textfield;
}

+ (UITextField *)getTextFieldWithThinFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block
{
  UITextField *textfield = [[UITextField alloc] init];
  if (IOS9) {
    textfield.font = [UIFont fontWithName:@"PingFangSC-Thin" size:size];
  } else {
    textfield.font = [UIFont fontWithName:@"Helvetica-Light" size:size];
  }
  textfield.textColor = [UIColor colorWithHex:colorHex];
  textfield.placeholder = placeHolder;
  textfield.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:textfield];
  
  [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(textfield,make);
    }
  }];
  
  return textfield;
}

+ (UITextField *)getTextFieldWithLightFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block
{
  UITextField *textfield = [[UITextField alloc] init];
  if (IOS9) {
    textfield.font = [UIFont fontWithName:@"PingFangSC-Light" size:size];
  } else {
    textfield.font = [UIFont fontWithName:@"Helvetica" size:size];
  }
  textfield.textColor = [UIColor colorWithHex:colorHex];
  textfield.placeholder = placeHolder;
  textfield.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:textfield];
  
  [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(textfield,make);
    }
  }];
  
  return textfield;
}

+ (UITextField *)getTextFieldWithRegularFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block
{
  UITextField *textfield = [[UITextField alloc] init];
  if (IOS9) {
    textfield.font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
  } else {
    textfield.font = [UIFont fontWithName:@"Helvetica" size:size];
  }
  textfield.textColor = [UIColor colorWithHex:colorHex];
  textfield.placeholder = placeHolder;
  textfield.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:textfield];
  
  [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(textfield,make);
    }
  }];
  
  return textfield;
}

+ (UITextField *)getTextFieldWithMediumFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block
{
  UITextField *textfield = [[UITextField alloc] init];
  if (IOS9) {
    textfield.font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
  } else {
    textfield.font = [UIFont fontWithName:@"Helvetica-Bold" size:size];
  }
  textfield.textColor = [UIColor colorWithHex:colorHex];
  textfield.placeholder = placeHolder;
  textfield.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:textfield];
  
  [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(textfield,make);
    }
  }];
  
  return textfield;
}

+ (UITextField *)getTextFieldWithSemiboldFontSize:(NSInteger)size textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block
{
  UITextField *textfield = [[UITextField alloc] init];
  if (IOS9) {
    textfield.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
  } else {
    textfield.font = [UIFont fontWithName:@"Helvetica-Bold" size:size];
  }
  textfield.textColor = [UIColor colorWithHex:colorHex];
  textfield.placeholder = placeHolder;
  textfield.translatesAutoresizingMaskIntoConstraints = NO;
  [superView addSubview:textfield];
  
  [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
    if (block) {
      block(textfield,make);
    }
  }];
  
  return textfield;
}

@end
