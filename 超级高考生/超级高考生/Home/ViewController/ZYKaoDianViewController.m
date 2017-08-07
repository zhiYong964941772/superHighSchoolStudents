//
//  ZYKaoDianViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/3.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYKaoDianViewController.h"
#import "ZYKaoDianTableView.h"
@interface ZYKaoDianViewController ()
{
    CGSize jianjieSize;
}
@property (weak, nonatomic) IBOutlet UIButton *shipin;
@property (weak, nonatomic) IBOutlet UIButton *ziliao;
@property (weak, nonatomic) IBOutlet UIButton *jingpin;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *chuangzuoView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (nonatomic ,strong)ZYKaoDianTableView *kaoDianTableView;

@end

@implementation ZYKaoDianViewController
- (ZYKaoDianTableView *)kaoDianTableView{
    if (!_kaoDianTableView) {
        _kaoDianTableView = [ZYKaoDianTableView showView:CGRectMake(0, 0, SCREEN_WIDTH, 256)];
    }
    return _kaoDianTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self  cellEvent];
    
}
- (void)creatUI{
    [self.view addSubview:self.kaoDianTableView];
    
    [self.kaoDianTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.bgView.mas_bottom).with.offset(0);
    }];
//    jianjieSize = [self.jianjieLB.text sizeWithFont:[UIFont systemFontOfSize:12] maxW:SCREEN_WIDTH - 20];
}

- (void)cellEvent{
    @weakify(self);
    self.kaoDianTableView.cellTapBlock = ^(id data) {
        @strongify(self);
       
        
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)shareAction:(id)sender {
}
- (IBAction)shoucangAction:(id)sender {
}
- (IBAction)shipinAction:(id)sender {
    self.shipin.selected = YES;
    self.ziliao.selected = NO;
    self.jingpin.selected = NO;
//    [self.chuangzuoView setAlpha:0.0];
//    [self.kaoDianTableView setAlpha:1.0];
//    [self.growthXuefenTableView setAlpha:0.0];
}
- (IBAction)ziliaoAction:(id)sender {
    self.shipin.selected = NO;
    self.ziliao.selected = YES;
    self.jingpin.selected = NO;
//    [self.chuangzuoView setAlpha:1.0];
//    [self.growthTableView setAlpha:0.0];
//    [self.growthXuefenTableView setAlpha:0.0];
    
}
- (IBAction)jingpinAction:(id)sender {
    self.shipin.selected = NO;
    self.ziliao.selected = NO;
    self.jingpin.selected = YES;
//    [self.chuangzuoView setAlpha:0.0];
//    [self.growthTableView setAlpha:0.0];
//    [self.growthXuefenTableView setAlpha:1.0];
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
