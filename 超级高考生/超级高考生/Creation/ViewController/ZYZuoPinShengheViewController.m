//
//  ZYZuoPinShengheViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/8.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYZuoPinShengheViewController.h"

@interface ZYZuoPinShengheViewController ()

@end

@implementation ZYZuoPinShengheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)backVC:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
