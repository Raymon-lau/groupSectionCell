//
//  KDCustombutton.h
//  KDLC
//
//  Created by 曹晓丽 on 16/8/19.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

//指定imageEdge前两个参数所代表的方向
typedef NS_ENUM(NSUInteger, ImageEdgeDirection) {
  ImageEdgeTopLeft,
  ImageEdgeTopRight,
  ImageEdgeBottomLeft,
  ImageEdgeBottomRight
};

@interface KDCustombutton : UIButton

/**
 *  默认是UIEdgeInsetsZero,必须指定ImageEdgeDirection，指定前两个参数代表的方向，默认为前两个参数分别代表距上、左的距离，后两个参数为宽和高
 */
@property (nonatomic, assign) UIEdgeInsets imageEdge;                //默认是UIEdgeInsetsZero,分别传上、左、宽、高
@property (nonatomic, assign) ImageEdgeDirection imageDirection;
@property (nonatomic, assign) UIEdgeInsets titleEdge;                //默认是UIEdgeInsetsZero，分别传上、左、下、右，四个参数都为距button的距离

@end
