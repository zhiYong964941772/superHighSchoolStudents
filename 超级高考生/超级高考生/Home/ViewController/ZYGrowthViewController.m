//
//  ZYGrowthViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/2.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYGrowthViewController.h"
#import "QuestionShufflingView.h"
#import "ZYGrowthTableView.h"
#import "ZYGrowthXueFenTableView.h"
#import "ZYGrowthGuiZeViewController.h"
#import "ZYKaoTiViewController.h"
@interface ZYGrowthViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *shufflingBgImage;
@property (weak, nonatomic) IBOutlet UIButton *jilu;
@property (weak, nonatomic) IBOutlet UIButton *chuangzuozhe;
@property (weak, nonatomic) IBOutlet UIButton *xiuxuefen;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *chuangzuoView;
@property (nonatomic ,strong)ZYGrowthTableView *growthTableView;
@property (nonatomic ,strong)ZYGrowthXueFenTableView *growthXuefenTableView;

@end
@implementation ZYGrowthViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = nil;
}
- (ZYGrowthTableView *)growthTableView{
    if (!_growthTableView) {
        _growthTableView = [ZYGrowthTableView showGrowthView:CGRectMake(0, 0, SCREEN_WIDTH, 256)];
    }
    return _growthTableView;
}
- (ZYGrowthXueFenTableView *)growthXuefenTableView{
    if (!_growthXuefenTableView) {
        _growthXuefenTableView = [ZYGrowthXueFenTableView showGrowthXueFenView:CGRectMake(0, 0, SCREEN_WIDTH, 256)];
        [_growthXuefenTableView setAlpha:0.0];
    }
    return _growthXuefenTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"我的成长";
    [self setupRightBtn];
    [self creatUI];
    [self cellEvent];

}
- (void)creatUI{
    [self.view addSubview:self.growthTableView];
    [self.view addSubview:self.growthXuefenTableView];
    [self.growthTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.bgView.mas_bottom);
    }];
    [self.growthXuefenTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.bgView.mas_bottom);
    }];
}

- (void)cellEvent{
    @weakify(self);
    self.growthTableView.cellTapBlock = ^(id data) {
        @strongify(self);
        ZYKaoTiViewController *kaoTiVc = [[ZYKaoTiViewController alloc]initWithNibName:@"ZYKaoTiViewController" bundle:nil];
        [self.navigationController pushViewController:kaoTiVc animated:YES];
    };
    self.growthXuefenTableView.cellTapBlock = ^(id data) {
        @strongify(self);
  
    };
}
- (void)setupRightBtn{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"规则" style:UIBarButtonItemStyleDone target:self action:@selector(guizheAction)];
    
}
- (void)guizheAction{
    ZYGrowthGuiZeViewController *guiZeVc = [[ZYGrowthGuiZeViewController alloc]initWithNibName:@"ZYGrowthGuiZeViewController" bundle:nil];
    [self.navigationController pushViewController:guiZeVc animated:YES];
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
- (IBAction)jiAction:(id)sender {
    [self.chuangzuoView setAlpha:0.0];
    [self.growthTableView setAlpha:1.0];
    [self.growthXuefenTableView setAlpha:0.0];
}
- (IBAction)chuangzuozheAction:(id)sender {
    [self.chuangzuoView setAlpha:1.0];
    [self.growthTableView setAlpha:0.0];
    [self.growthXuefenTableView setAlpha:0.0];

}
- (IBAction)xiuxuefenAction:(id)sender {
    [self.chuangzuoView setAlpha:0.0];
    [self.growthTableView setAlpha:0.0];
    [self.growthXuefenTableView setAlpha:1.0];
}

@end
