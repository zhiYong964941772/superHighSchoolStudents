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
@interface ZYHomeViewController ()

@end

@implementation ZYHomeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatUI];
}
- (void)creatUI{
    ZYNavigationController *navi = self.navigationController;
    CGRect frame = CGRectMake(0,CGRectGetMaxY(navi.shuffingView.frame), SCREEN_WIDTH, 90);
    ZYHomeItemView *itemView = [ZYHomeItemView showItemView];
    [itemView setFrame:frame];
    [self.view addSubview:itemView];
    ZYHomeTableView *tableView = [ZYHomeTableView showHomeView:CGRectMake(0, CGRectGetMaxY(itemView.frame), SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(itemView.frame)-44)];
    [self.view addSubview:tableView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.mNavigationView];
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
