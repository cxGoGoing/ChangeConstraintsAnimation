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
    if (size.width == 0 && size.height == 0) {
        return nil;
    }
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    [self drawInRect:rect];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
+ (UIImage*)xsy_CreatePureCirlceImage:(CGSize)size color:(UIColor *)backgroundColor{
    if (size.width == 0 && size.height == 0) {
        return nil;
    }
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    [backgroundColor set];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFill);
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}
@end
