//
//  ZYProfessionalViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/29.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYProfessionalViewController.h"
#import "ZYNavigationController.h"
#import "ZYProfessionItemView.h"
#import "ZYTabBarViewController.h" 
#import "ZYProfessionCollectionView.h"
#import "ZYDakaViewController.h"
#import "ZYJiaoXueViewController.h"
#import "ZYYaZhouViewController.h"
#import "ZYJiaoPeiViewController.h"
@interface ZYProfessionalViewController ()

@end

@implementation ZYProfessionalViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    ZYNavigationController *navi = (ZYNavigationController*)self.navigationController;
    [self.navigationController setNavigationBarHidden:YES];
    ZYTabBarViewController *tab = (ZYTabBarViewController*)self.tabBarController;
    [tab.pan setEnabled:YES];
    [navi.shuffingView setAlpha:1.0];
    [navi.mNavigationView setAlpha:1.0];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatUI];
}
- (void)creatUI{
    ZYProfessionItemView *itemView = [ZYProfessionItemView showItemViewWithBtnAction:^(ZYProfessionItemView *view) {
        view.zy_DaKa = ^{
            ZYDakaViewController *daka = [[ZYDakaViewController alloc]init];
            [self.navigationController pushViewController:daka animated:YES];
        };
        view.zy_JiaoXue = ^{
            ZYJiaoXueViewController *jiaoXue = [[ZYJiaoXueViewController alloc]init];
            [self.navigationController pushViewController:jiaoXue animated:YES];
        };
        view.zy_YaZhou = ^{
            ZYYaZhouViewController *yazhou = [[ZYYaZhouViewController alloc]init];
            [self.navigationController pushViewController:yazhou animated:YES];
            
        };
        view.zy_JiaoPei = ^{
            ZYJiaoPeiViewController *jiaopei = [[ZYJiaoPeiViewController alloc]init];
            [self.navigationController pushViewController:jiaopei animated:YES];
        };
    }];
    [self.view addSubview:itemView];
    
    ZYProfessionCollectionView *collectionView = [ZYProfessionCollectionView showProfessionCollectionView:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT - CGRectGetMaxY(itemView.frame)-44)];
    
    [self.view addSubview:collectionView];
    [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SCREEN_HEIGHT/4+64);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(90);
    }];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(itemView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-44);
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    ZYNavigationController *navi = (ZYNavigationController*)self.navigationController;
    [navi.shuffingView setAlpha:0.0];
    [navi.mNavigationView setAlpha:0.0];
    ZYTabBarViewController *tab = (ZYTabBarViewController*)self.tabBarController;
    [tab.pan setEnabled:NO];
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
