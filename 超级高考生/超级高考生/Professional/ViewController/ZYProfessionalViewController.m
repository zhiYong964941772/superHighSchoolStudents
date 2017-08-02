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
#import "ZYProfessionCollectionView.h"
@interface ZYProfessionalViewController ()

@end

@implementation ZYProfessionalViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatUI];
}
- (void)creatUI{
    ZYNavigationController *navi = self.navigationController;
    CGRect frame = CGRectMake(0,CGRectGetMaxY(navi.shuffingView.frame), SCREEN_WIDTH, 90);
    ZYProfessionItemView *itemView = [ZYProfessionItemView showItemView];
    [itemView setFrame:frame];
    [self.view addSubview:itemView];
    
    ZYProfessionCollectionView *collectionView = [ZYProfessionCollectionView showProfessionCollectionView:CGRectMake(0, CGRectGetMaxY(itemView.frame),SCREEN_WIDTH,SCREEN_HEIGHT - CGRectGetMaxY(itemView.frame)-44)];
    
    [self.view addSubview:collectionView];

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
