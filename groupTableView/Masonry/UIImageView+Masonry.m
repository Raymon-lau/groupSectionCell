//
//  UIImageView+Masonry.m
//  KDLC
//
//  Created by appleMac on 16/6/6.
//  Copyright © 2016年 llyt. All rights reserved.
//

#import "UIImageView+Masonry.h"

@implementation UIImageView (Masonry)

+(UIImageView *)getImageViewWithImageName:(NSString *)imageName superView:(UIView *)superView masonrySet:(void (^)(UIImageView *view,MASConstraintMaker *make))block
{
    UIImageView *imageView;
    if (!imageName || [imageName isEqualToString:@""]) {
        imageView = [[UIImageView alloc] init];
    } else {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    }
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(imageView,make);
        }
    }];
    
    return imageView;
}

@end
