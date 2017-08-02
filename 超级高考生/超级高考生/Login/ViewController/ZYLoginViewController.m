//
//  ZYLoginViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/29.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYLoginViewController.h"
#import "ZYTabBarViewController.h"
#import "ZYForgetViewController.h"
#import "ZYSignViewController.h"
@interface ZYLoginViewController ()

@end

@implementation ZYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)qqAction:(UIButton *)sender {
}
- (IBAction)weiBoAction:(UIButton *)sender {
}
- (IBAction)weixinAction:(UIButton *)sender {
}
- (IBAction)regisAction:(UIButton *)sender {
    ZYSignViewController *signVc = [[ZYSignViewController alloc]initWithNibName:@"ZYSignViewController" bundle:nil];
    [self.navigationController pushViewController:signVc animated:YES];
}
- (IBAction)forgetAction:(UIButton *)sender {
    ZYForgetViewController *forgetVc = [[ZYForgetViewController alloc]initWithNibName:@"ZYForgetViewController" bundle:nil];
    [self.navigationController pushViewController:forgetVc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loginAction:(UIButton *)sender {
    ZYTabBarViewController *tabVC = [[ZYTabBarViewController alloc]init];
    [self presentViewController:tabVC animated:YES completion:nil];
}

@end
