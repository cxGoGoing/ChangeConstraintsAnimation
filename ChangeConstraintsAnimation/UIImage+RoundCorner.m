//
//  UIImage+RoundCorner.m
//  ChangeConstraintsAnimation
//
//  Created by chengxun on 16/3/15.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "UIImage+RoundCorner.h"

@implementation UIImage (RoundCorner)
- (UIImage*)xsy_addRoundCorner:(CGFloat)radius Size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    UIBezierPath * beziePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, beziePath.CGPath);
    CGContextClip(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
