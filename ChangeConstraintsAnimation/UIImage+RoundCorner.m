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
    //UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    [self drawInRect:rect];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
