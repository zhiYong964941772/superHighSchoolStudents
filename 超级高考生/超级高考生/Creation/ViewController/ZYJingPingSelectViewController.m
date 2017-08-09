//
//  ZYJingPingSelectViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/9.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYJingPingSelectViewController.h"
#import "ZYJingPingSelectTableView.h"
#import "ZYSelectKaoDianViewController.h"
@interface ZYJingPingSelectViewController ()
@property (nonatomic ,strong)ZYJingPingSelectTableView *tableView;
@end

@implementation ZYJingPingSelectViewController
- (ZYJingPingSelectTableView *)tableView{
    if (!_tableView) {
        _tableView = [ZYJingPingSelectTableView showView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self  cellEvent];
    [self setTitle:@"选择专题"];
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)creatUI{
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    //    jianjieSize = [self.jianjieLB.text sizeWithFont:[UIFont systemFontOfSize:12] maxW:SCREEN_WIDTH - 20];
    
}

- (void)cellEvent{
    @weakify(self);
    self.tableView.cellTapBlock = ^(id data) {
        @strongify(self);
        ZYSelectKaoDianViewController *selectKDVC = [[ZYSelectKaoDianViewController alloc]init];
        [self.navigationController pushViewController:selectKDVC animated:YES];
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
