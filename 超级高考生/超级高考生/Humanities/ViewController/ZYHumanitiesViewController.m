//
//  ZYHumanitiesViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/29.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYHumanitiesViewController.h"
#import "ZYNavigationController.h"
#import "ZYHumanitieTableView.h"
#import "ZYTabBarViewController.h"
#import "ZYKaoDianViewController.h"
@interface ZYHumanitiesViewController ()

@end

@implementation ZYHumanitiesViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    ZYNavigationController *navi = (ZYNavigationController*)self.navigationController;
    ZYTabBarViewController *tab = (ZYTabBarViewController*)self.tabBarController;
    [tab.pan setEnabled:YES];
    [navi.shuffingView setAlpha:1.0];
    [navi.mNavigationView setAlpha:1.0];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    ZYNavigationController *navi = self.navigationController;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    ZYHumanitieTableView *tableView = [ZYHumanitieTableView showView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(navi.shuffingView.frame)-44)];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SCREEN_HEIGHT/4+64);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    tableView.cellTapBlock = ^(id data) {
        ZYKaoDianViewController *kaoti = [[ZYKaoDianViewController alloc]initWithNibName:@"ZYKaoDianViewController" bundle:nil];
        [self.navigationController pushViewController: kaoti animated:YES];
    };
    
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
