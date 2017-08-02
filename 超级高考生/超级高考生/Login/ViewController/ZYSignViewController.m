//
//  ZYSignViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/1.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYSignViewController.h"

@interface ZYSignViewController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation ZYSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"注册账号";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)recommendedAction:(UIButton *)sender {
   BOOL isBgV = sender.selected = !sender.selected;
    [self.bgView setAlpha:(isBgV)?0.0:1.0];
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
