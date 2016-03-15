//
//  HomeViewController.m
//  ChangeConstraintsAnimation
//
//  Created by chengxun on 16/3/15.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "HomeViewController.h"
#import <PureLayout.h>
#import "UIImage+RoundCorner.h"
#import "TextCell.h"
#if DEBUG
#import "FLEXManager.h"
#endif
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak)UIImageView * redImageView;
@property (nonatomic,strong)NSLayoutConstraint * widthConstraint;
@property (nonatomic,strong)NSLayoutConstraint * topConstraint;
@property (nonatomic,weak)UITableView * tableView;
@end
static NSString * textCell = @"TextCell";
@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"FLEX" style:UIBarButtonItemStyleDone target:self action:@selector(showFLex)];
    [self setUpUI];
    //[self setUpRedImageView];
    // Do any additional setup after loading the view.
}
- (void)showFLex{
    [[FLEXManager sharedManager]showExplorer];
}

#pragma mark -- TableView Delegate and DataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TextCell * cell = [tableView dequeueReusableCellWithIdentifier:textCell];
    cell.imageName = @"https://devrs.s3.cn-north-1.amazonaws.com.cn/10201/2016/03/14/s_fc00694e-871f-4ffc-8eb6-28bc4341fabc.jpg";
    cell.indexPath = indexPath;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44+indexPath.row*2;
}

- (void)setUpUI{
    UITableView * tableView = [[UITableView alloc]init];
    [self.view addSubview:tableView];
    [tableView autoPinEdgesToSuperviewEdges];
    [tableView registerClass:[TextCell class] forCellReuseIdentifier:textCell];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
}

- (void)setUpRedImageView{
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
