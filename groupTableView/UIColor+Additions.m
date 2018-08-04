//
//  UIColor+Additions.m
//  IOSBasic
//
//  Created by 曹晓丽 on 2018/6/4.
//  Copyright © 2018年 KD. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)

+ (UIColor *)colorWithHex:(NSString *)hexColor {
    return [UIColor colorWithHex:hexColor alpha:1.0f];
}

+ (UIColor *)colorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha {
    if (hexColor == nil) {
        return nil;
    }
    if ([hexColor length] < 7 ) {
        return nil;
    }
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 1;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:alpha];
}

@end
