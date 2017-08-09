//
//  ZYCreationViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/29.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYCreationViewController.h"
#import "ZYNavigationController.h"
#import "ZYCreationTableView.h"
#import "ZYTabBarViewController.h"
#import "ZYZuoPinShengheViewController.h"
#import "ZYNavigationSubView.h"
#import "ZYGuiZeViewController.h"
#import "ZYAddJinPingViewController.h"
#import "KxMenu.h"
#import "ZYJingPingSelectViewController.h"
#import "ZYMyZuoPingViewController.h"
#import "ZYChengGuoViewController.h"
@interface ZYCreationViewController ()
@property(nonatomic ,strong)ZYAddJinPingViewController *addJinPingVC ;
@property(nonatomic ,strong)ZYMyZuoPingViewController *myZPVC ;

@end

@implementation ZYCreationViewController
- (ZYAddJinPingViewController *)addJinPingVC{
    if (!_addJinPingVC) {
        _addJinPingVC = [[ZYAddJinPingViewController alloc]initWithNibName:@"ZYAddJinPingViewController" bundle:nil];
    }
    return _addJinPingVC;
}
- (ZYMyZuoPingViewController *)myZPVC{
    if (!_myZPVC) {
        _myZPVC = [[ZYMyZuoPingViewController alloc]init];
    }
    return _myZPVC;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    ZYTabBarViewController *tab = (ZYTabBarViewController*)self.tabBarController;
    [tab.pan setEnabled:YES];
    ZYNavigationController *navi = (ZYNavigationController*)self.navigationController;
    [navi.mNavigationSubView setAlpha:1.0];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatUI];
    [ZHI_NSNotificationCenter addObserver:self selector:@selector(zy_ZuoPing:) name:@"ZY_ZUOPING" object:nil];
    
    [ZHI_NSNotificationCenter addObserver:self selector:@selector(zy_yuanchuang) name:@"ZY_YUANCHUANG" object:nil];
    [ZHI_NSNotificationCenter addObserver:self selector:@selector(zy_jinping) name:@"ZY_JINPING" object:nil];
    [ZHI_NSNotificationCenter addObserver:self selector:@selector(zy_chengguo) name:@"ZY_CHENGGUO" object:nil];

}
- (void)creatUI{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    ZYNavigationController *navi = self.navigationController;
    ZYNavigationSubView *subView = navi.mNavigationSubView;
    ZYCreationTableView *tableView = [ZYCreationTableView showView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(navi.mNavigationSubView.frame)-44)];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(180);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    tableView.cellTapBlock = ^(id data) {
        ZYZuoPinShengheViewController *zuoPVC = [[ZYZuoPinShengheViewController alloc]initWithNibName:@"ZYZuoPinShengheViewController" bundle:nil];
        [self.navigationController pushViewController:zuoPVC animated:YES]; 
        
    };
    tableView.zy_guizheBlock = ^{
        ZYGuiZeViewController *guizeVC = [[ZYGuiZeViewController alloc]initWithNibName:@"ZYGuiZeViewController" bundle:nil];
        [self.navigationController pushViewController:guizeVC animated:YES];
    };
}
- (void)zy_ZuoPing:(NSNotification *)notification{
    NSDictionary *dic = notification.userInfo;
    NSString *str = dic[@"MemuFrame"];
    CGRect frame = CGRectFromString(str);
    NSArray *menuItem = @[[KxMenuItem menuItem:@"原创" image:nil target:self action:@selector(yuanchuang)],[KxMenuItem menuItem:@"精评" image:nil target:self action:@selector(jingping)]];
    frame.origin.y +=20;
    [KxMenu showMenuInView:[UIApplication sharedApplication].keyWindow fromRect:frame menuItems:menuItem];

}
- (void)zy_yuanchuang{
    self.myZPVC.title = @"我的原创作品";
    [self.navigationController pushViewController:self.myZPVC animated:YES];
}

- (void)zy_jinping{
    self.myZPVC.title = @"我的精评作品";
    [self.navigationController pushViewController:self.myZPVC animated:YES];


}
- (void)zy_chengguo{
    ZYChengGuoViewController *cgVC = [[ZYChengGuoViewController alloc]initWithNibName:@"ZYChengGuoViewController" bundle:nil];
    [self.navigationController pushViewController:cgVC animated:YES];
}
- (void)yuanchuang{
    self.addJinPingVC.title = @"添加原创";
    [self.navigationController pushViewController:self.addJinPingVC animated:YES];
}
- (void)jingping{
    ZYJingPingSelectViewController *jingPingVC = [[ZYJingPingSelectViewController alloc]init];
    [self.navigationController pushViewController:jingPingVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    ZYNavigationController *navi = (ZYNavigationController*)self.navigationController;
    ZYTabBarViewController *tab = (ZYTabBarViewController*)self.tabBarController;
    [tab.pan setEnabled:NO];
    [navi.mNavigationSubView setAlpha:0.0];
    
}
- (void)dealloc{
    [ZHI_NSNotificationCenter removeObserver:self];
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
