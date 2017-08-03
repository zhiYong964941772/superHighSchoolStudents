//
//  ZYKaoTiViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/3.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYKaoTiViewController.h"
#import "ZYKaoTiTableVIew.h"
#import "ZYKaoDianViewController.h"
@interface ZYKaoTiViewController ()
{
    CGSize jianjieSize;
}
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UILabel *jianjieLB;
@property (weak, nonatomic) IBOutlet UILabel *zhuantiLB;
@property (weak, nonatomic) IBOutlet UILabel *guankanLB;
@property (nonatomic ,strong)ZYKaoTiTableVIew *kaoTiTableView;
@property (weak, nonatomic) IBOutlet UIView *titleBgView;

@end

@implementation ZYKaoTiViewController
- (ZYKaoTiTableVIew *)kaoTiTableView{
    if (!_kaoTiTableView) {
        _kaoTiTableView = [ZYKaoTiTableVIew showKaoTiView:CGRectMake(0, 0, SCREEN_WIDTH, 256)];
    }
    return _kaoTiTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self creatUI];
    [self  cellEvent];
}
- (void)creatUI{
    [self.view addSubview:self.kaoTiTableView];
   
    [self.kaoTiTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.titleBgView.mas_bottom).with.offset(0);
    }];
    jianjieSize = [self.jianjieLB.text sizeWithFont:[UIFont systemFontOfSize:12] maxW:SCREEN_WIDTH - 20];
}

- (void)cellEvent{
    @weakify(self);
    self.kaoTiTableView.cellTapBlock = ^(id data) {
        @strongify(self);
        ZYKaoDianViewController *kaoDianVc = [[ZYKaoDianViewController alloc]initWithNibName:@"ZYKaoDianViewController" bundle:nil];
        [self.navigationController pushViewController:kaoDianVc animated:YES];
       
    };
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backAction:(id)sender {
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)shareAction:(id)sender {
}
- (IBAction)shoucangAction:(id)sender {
}
- (IBAction)gengduoAction:(UIButton *)sender {
   BOOL isTap = sender.selected = !sender.selected;
      
    
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
