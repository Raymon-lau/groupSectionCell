//
//  KDCustombutton.m
//  KDLC
//
//  Created by 曹晓丽 on 16/8/19.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "KDCustombutton.h"

@implementation KDCustombutton

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
  switch (self.imageDirection) {
    case ImageEdgeTopLeft:
      return CGRectMake(self.imageEdge.left, self.imageEdge.top, self.imageEdge.bottom, self.imageEdge.right);
      break;
    case ImageEdgeTopRight:
      return CGRectMake(contentRect.size.width - self.imageEdge.bottom - self.imageEdge.left, self.imageEdge.top, self.imageEdge.bottom, self.imageEdge.right);
      break;
    case ImageEdgeBottomLeft:
      return CGRectMake(self.imageEdge.left, contentRect.size.height - self.imageEdge.bottom - self.imageEdge.top, self.imageEdge.bottom, self.imageEdge.right);
      break;
    case ImageEdgeBottomRight:
      return CGRectMake(contentRect.size.width - self.imageEdge.bottom - self.imageEdge.left, contentRect.size.height - self.imageEdge.bottom - self.imageEdge.top, self.imageEdge.bottom, self.imageEdge.right);
      break;
    default:
      return CGRectMake(self.imageEdge.left, self.imageEdge.top, self.imageEdge.bottom, self.imageEdge.right);
      break;
  }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
  return CGRectMake(self.titleEdge.left, self.titleEdge.top, self.frame.size.width - self.titleEdge.left - self.titleEdge.right, self.frame.size.height - self.titleEdge.top - self.titleEdge.bottom);
}

@end
