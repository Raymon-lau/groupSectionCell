//
//  RMMYProjectTopView.m
//  RM
//
//  Created by Raymon on 2018/8/1.
//  Copyright © 2018年 raymon. All rights reserved.
//

#import "RMMYProjectTopView.h"

@implementation RMMYProjectTopView

//hitTest的作用:当在一个view上添加一个屏蔽罩，但又不影响对下面   view的操作，也就是可以透过屏蔽罩对下面的view进行操作，这个函数就很好用了。
//hitTest的用法：将下面的函数添加到UIView的子类中，也就是屏蔽罩类中即可。


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *result = [super hitTest:point withEvent:event];
    if (result == self) {
        return nil;
    } else {
        return result;
    }
}


@end
