//
//  UIColor+Additions.h
//  IOSBasic
//
//  Created by 曹晓丽 on 2018/6/4.
//  Copyright © 2018年 KD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

+ (UIColor *)colorWithHex:(NSString *)hexColor;

+ (UIColor *)colorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha;

@end
