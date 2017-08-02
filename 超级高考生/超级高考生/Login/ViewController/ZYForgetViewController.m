//
//  ZYForgetViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/31.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYForgetViewController.h"
#import "ZYForgetNextViewController.h"
@interface ZYForgetViewController ()

@end

@implementation ZYForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
self.title = @"忘记密码";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)smsAction:(UIButton *)sender {
}
- (IBAction)nextAction:(UIButton *)sender {
    ZYForgetNextViewController *nextVc = [[ZYForgetNextViewController alloc]initWithNibName:@"ZYForgetNextViewController" bundle:nil];
    [self.navigationController pushViewController:nextVc animated:YES];
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
