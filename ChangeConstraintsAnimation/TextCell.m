//
//  TextCell.m
//  ChangeConstraintsAnimation
//
//  Created by chengxun on 16/3/15.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "TextCell.h"
#import <PureLayout.h>
#import "UIImage+RoundCorner.h"
@interface TextCell()
@property (nonatomic,weak)UIImageView * titleImageView;
@end
@implementation TextCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI{
    UIImageView * titleImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:titleImageView];
    [titleImageView autoSetDimensionsToSize:CGSizeMake(50, 40)];
    [titleImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [titleImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    self.titleImageView = titleImageView;
}
- (void)setImageName:(NSString *)imageName{
    _imageName = [imageName copy];
    self.titleImageView.image = [[UIImage imageNamed:imageName]xsy_addRoundCorner:4 Size:CGSizeMake(50, 40)];
}


@end
