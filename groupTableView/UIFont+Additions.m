//
//  UIFont+Additions.m
//  KDLC
//
//  Created by 曹晓丽 on 2016/12/30.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "UIFont+Additions.h"

@implementation UIFont (Additions)

+ (UIFont *)kd_getCustomFontTypeWith:(CustomFontType)stringTypeName fontSize:(CGFloat)size {
  NSString *stringType = @"";
  switch (stringTypeName) {
    case Regular:
    {
      if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
        stringType = @"PingFangSC-Regular";
      } else {
        stringType = @"Helvetica";
      }
    }
      break;
    case Medium:
    {
      if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
        stringType = @"PingFangSC-Medium";
      } else {
        stringType = @"Helvetica-Bold";
      }
    }
      break;
    case Semibold:
    {
      if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
        stringType = @"PingFangSC-Semibold";
      } else {
        stringType = @"Helvetica-Bold";
      }
    }
      break;
    case Ultralight:
    {
      if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
        stringType = @"PingFangSC-Ultralight";
      } else {
        stringType = @"Helvetica-Light";
      }
    }
      break;
    case Thin:
    {
      if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
        stringType = @"PingFangSC-Thin";
      } else {
        stringType = @"Helvetica-Light";
      }
    }
      break;
    case Light:
    {
      if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
        stringType = @"PingFangSC-Light";
      } else {
        stringType = @"Helvetica";
      }
    }
      break;
    case DefaultFont:
    default:
      break;
  }
  
  if ([stringType isEqualToString:@""]) {
    return [UIFont systemFontOfSize:size];
  } else {
    return [UIFont fontWithName:stringType size:size];
  }
}

+ (UIFont *)ultralightFontOfSize:(CGFloat)fontSize {
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"PingFangSC-Ultralight" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Light" size:fontSize];
  }
}

+ (UIFont *)thinFontOfSize:(CGFloat)fontSize {
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"PingFangSC-Thin" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Light" size:fontSize];
  }
}

+ (UIFont *)lightFontOfSize:(CGFloat)fontSize {
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"PingFangSC-Light" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica" size:fontSize];
  }
}

+ (UIFont *)regularFontOfSize:(CGFloat)fontSize {
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica" size:fontSize];
  }
}

+ (UIFont *)mediumFontOfSize:(CGFloat)fontSize {
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
  }
}

+ (UIFont *)semiboldFontOfSize:(CGFloat)fontSize {
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
  }
}

//AppleSDGothicNeo-Bold  数字  字体
+ (UIFont *)numberBoldFontOfSize:(CGFloat)fontSize{
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
  }
}
//AppleSDGothicNeo-UltraLight  数字  字体
+ (UIFont *)numberUltraLightFontOfSize:(CGFloat)fontSize{
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"AppleSDGothicNeo-UltraLight" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
  }
}
//AppleSDGothicNeo-Thin  数字  字体
+ (UIFont *)numberThinFontOfSize:(CGFloat)fontSize{
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
  }
}

+ (UIFont *)numberLightFontOfSize:(CGFloat)fontSize{
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
  }
}

//AppleSDGothicNeo-Regular  数字  字体
+ (UIFont *)numberRegularFontOfSize:(CGFloat)fontSize{
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
  }
}

//AppleSDGothicNeo-Medium   数字  字体
+ (UIFont *)numberMediumFontOfSize:(CGFloat)fontSize{
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
  }
}
//AppleSDGothicNeo-SemiBold   数字  字体
+ (UIFont *)numberSemiBoldFontOfSize:(CGFloat)fontSize{
  if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=9.0)) {
    return [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:fontSize];
  } else {
    return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
  }
}
@end
