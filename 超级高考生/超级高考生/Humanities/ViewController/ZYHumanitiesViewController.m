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
@interface ZYHumanitiesViewController ()

@end

@implementation ZYHumanitiesViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    ZYNavigationController *navi = self.navigationController;
    
    ZYHumanitieTableView *tableView = [ZYHumanitieTableView showHumanitieView:CGRectMake(0, CGRectGetMaxY(navi.shuffingView.frame), SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(navi.shuffingView.frame)-44)];
    [self.view addSubview:tableView];
    
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
