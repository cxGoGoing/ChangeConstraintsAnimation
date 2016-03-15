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
#import "UIImageView+WebCache.h"
@interface TextCell()
@property (nonatomic,weak)UIImageView * titleImageView;
@property (nonatomic,weak)UIImageView * pureImageView;
@property (nonatomic,weak)UIImageView * leadImageView;
@end
@implementation TextCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI{
  UIImageView *titleImageView = [[UIImageView alloc] init];
  [self.contentView addSubview:titleImageView];
  [titleImageView autoSetDimensionsToSize:CGSizeMake(50, 40)];
  [titleImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
  [titleImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
  self.titleImageView = titleImageView;

  UIImageView *pureImageView = [[UIImageView alloc] init];
  [self.contentView addSubview:pureImageView];
  pureImageView.image = [UIImage xsy_CreatePureCirlceImage:CGSizeMake(20, 20)
                                                     color:[UIColor redColor]];
  [pureImageView autoSetDimensionsToSize:CGSizeMake(20, 20)];
  [pureImageView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
  [pureImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
  self.pureImageView = pureImageView;

    UIImageView *leadImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:leadImageView];
    [leadImageView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
    [leadImageView autoSetDimensionsToSize:CGSizeMake(50, 40)];
    [leadImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    self.leadImageView=leadImageView;
}
- (void)setImageName:(NSString *)imageName{
    _imageName = [imageName copy];
    __weak typeof(self)weakSelf = self;
    [self.titleImageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"Swift"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        weakSelf.titleImageView.image = [image xsy_addRoundCorner:4 Size:CGSizeMake(50, 40)];
    }];

    self.leadImageView.image = [UIImage xsy_addRoundCorner:4 size:CGSizeMake(50, 40) backgroudnImage:[UIImage imageNamed:@"images"]];
}


@end
