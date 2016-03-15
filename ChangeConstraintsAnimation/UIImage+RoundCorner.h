//
//  UIImage+RoundCorner.h
//  ChangeConstraintsAnimation
//
//  Created by chengxun on 16/3/15.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundCorner)
- (UIImage*)xsy_addRoundCorner:(CGFloat)radius Size:(CGSize)size;
+ (UIImage*)xsy_CreatePureCirlceImage:(CGSize)size color:(UIColor*)backgroundColor;
+ (UIImage*)xsy_CreatePureCirlceImage:(CGSize)size color:(UIColor *)backgroundColor radius:(CGFloat)radius;
+ (UIImage*)xsy_addRoundCorner:(CGFloat)radius size:(CGSize)size backgroudnImage:(UIImage*)backgroundImage;
@end
