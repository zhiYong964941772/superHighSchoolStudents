//
//  ZYHomeViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/29.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYHomeViewController.h"
#import "ZYHomeItemView.h"
#import "ZYNavigationController.h"
#import "ZYHomeTableView.h"
#import "ZYGrowthViewController.h"
#import "ZYTabBarViewController.h"
#import "ZYBiJiViewController.h"
#import "ZYHuoDongViewController.h"
@interface ZYHomeViewController ()

@end

@implementation ZYHomeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    ZYNavigationController *navi = (ZYNavigationController*)self.navigationController;
    ZYTabBarViewController *tab = (ZYTabBarViewController*)self.tabBarController;
    [tab.pan setEnabled:YES];
    [navi.shuffingView setAlpha:1.0];
    [navi.mNavigationView setAlpha:1.0];
}
- (void)creatUI{
    ZYHomeItemView *itemView = [ZYHomeItemView showItemViewWitBtnAction:^(ZYHomeItemView *view) {
        view.growthBlock = ^{
            ZYGrowthViewController *growthVC = [[ZYGrowthViewController alloc]initWithNibName:@"ZYGrowthViewController" bundle:nil];
            [self.navigationController pushViewController:growthVC animated:YES];
        };
        view.notesBlock = ^{
            ZYBiJiViewController *biJiVC = [[ZYBiJiViewController alloc]init];
            [self.navigationController pushViewController:biJiVC animated:YES];
        };
        view.activity = ^{
            ZYHuoDongViewController *huoDongVC = [[ZYHuoDongViewController alloc]init];
            [self.navigationController pushViewController:huoDongVC animated:YES];
        };
        view.bookStoresBlock = ^{
            
        };
    }];
    [self.view addSubview:itemView];
    ZYHomeTableView *tableView = [ZYHomeTableView showView:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(itemView.frame)-44)];
    [self.view addSubview:tableView];
    [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SCREEN_HEIGHT/4+64);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(90);
    }];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(itemView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-44);

    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self.view setBackgroundColor:[UIColor whiteColor]];



//    [self.view addSubview:self.mNavigationView];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    ZYNavigationController *navi = (ZYNavigationController*)self.navigationController;
    [navi.shuffingView setAlpha:0.0];
    [navi.mNavigationView setAlpha:0.0];
    ZYTabBarViewController *tab = (ZYTabBarViewController*)self.tabBarController;
    [tab.pan setEnabled:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
