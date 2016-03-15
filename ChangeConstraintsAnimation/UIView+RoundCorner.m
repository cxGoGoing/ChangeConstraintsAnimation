//
//  UIView+RoundCorner.m
//  ChangeConstraintsAnimation
//
//  Created by chengxun on 16/3/15.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "UIView+RoundCorner.h"
#import "UIImage+RoundCorner.h"
@implementation UIView (RoundCorner)
- (void)xsy_addRoundCorner:(CGFloat)radius size:(CGSize)size backgroudColor:(UIColor*)backgroudColor{
    if(size.width == 0 || size.height == 0){
        return;
    }
}
/**  防止像素没有落在坐标点上  */
static inline float pixel(float num){
    float unit = 1.0 / [UIScreen mainScreen].scale;
    double remain = fmod(num, unit);
    return num - remain + (remain >= unit / 2.0? unit: 0);
}
@end
