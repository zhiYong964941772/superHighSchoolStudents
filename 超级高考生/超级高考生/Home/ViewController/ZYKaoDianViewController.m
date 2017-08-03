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

@property (nonatomic ,strong)ZYKaoDianTableView *kaoDianTableView;

@end

@implementation ZYKaoDianViewController
- (ZYKaoDianTableView *)kaoTiTableView{
    if (!_kaoDianTableView) {
        _kaoDianTableView = [ZYKaoDianTableView showKaoDianView:CGRectMake(0, 0, SCREEN_WIDTH, 256)];
    }
    return _kaoDianTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self  cellEvent];
}
- (void)creatUI{
    [self.view addSubview:self.kaoTiTableView];
    
    [self.kaoDianTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.titleBgView.mas_bottom).with.offset(0);
    }];
//    jianjieSize = [self.jianjieLB.text sizeWithFont:[UIFont systemFontOfSize:12] maxW:SCREEN_WIDTH - 20];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
