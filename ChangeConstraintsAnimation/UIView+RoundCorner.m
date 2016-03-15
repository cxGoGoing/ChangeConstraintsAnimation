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
    size = CGSizeMake(pixel(size.width), pixel(size.height));
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage * image = [UIImage xsy_CreatePureCirlceImage:size color:backgroudColor radius:radius];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.frame = self.frame = CGRectMake(pixel(self.frame.origin.x), pixel(self.frame.origin.y), size.width, size.height);
            if([self isKindOfClass:[UIImageView class]]){
                ((UIImageView*)self).image = image;
            }else if([self isKindOfClass:[UIButton class]]){
                 [((UIButton *)self) setBackgroundImage:image forState:UIControlStateNormal];
            }else if([self isKindOfClass:[UILabel class]]){
                self.layer.backgroundColor = [UIColor colorWithPatternImage:image].CGColor;
            }else{
                self.layer.contents = (__bridge id _Nullable)(image.CGImage);
            }
        });
    });
}
/**  防止像素没有落在坐标点上  */
static inline float pixel(float num){
    float unit = 1.0 / [UIScreen mainScreen].scale;
    double remain = fmod(num, unit);
    return num - remain + (remain >= unit / 2.0? unit: 0);
}
@end
