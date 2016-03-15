//
//  HomeViewController.m
//  ChangeConstraintsAnimation
//
//  Created by chengxun on 16/3/15.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "HomeViewController.h"
#import <PureLayout.h>
@interface HomeViewController ()
@property (nonatomic,weak)UIImageView * redImageView;
@property (nonatomic,strong)NSLayoutConstraint * widthConstraint;
@property (nonatomic,strong)NSLayoutConstraint * topConstraint;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    // Do any additional setup after loading the view.
}

- (void)setUpUI{
    UIImageView * redImageView = [[UIImageView alloc]init];
    [self.view addSubview:redImageView];
    redImageView.backgroundColor = [UIColor redColor];
    self.topConstraint = [redImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100];
    self.widthConstraint = [redImageView autoSetDimension:ALDimensionWidth toSize:50];
    [redImageView autoSetDimension:ALDimensionHeight toSize:50];
    [redImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];

    self.redImageView = redImageView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:2 animations:^{
        self.topConstraint.constant = 200;
        [self.redImageView layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
