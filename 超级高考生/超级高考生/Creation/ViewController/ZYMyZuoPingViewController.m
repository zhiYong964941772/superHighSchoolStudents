//
//  ZYMyZuoPingViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/9.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYMyZuoPingViewController.h"
#import "ZYMyZuoPingTableView.h"
#import "ZYZuoPinShengheViewController.h"

@interface ZYMyZuoPingViewController ()
@property (nonatomic ,strong)ZYMyZuoPingTableView *tableView;

@end
@implementation ZYMyZuoPingViewController
- (ZYMyZuoPingTableView *)tableView{
    if (!_tableView) {
        _tableView = [ZYMyZuoPingTableView showView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _tableView;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self  cellEvent];
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
        ZYZuoPinShengheViewController *selectKDVC = [[ZYZuoPinShengheViewController alloc]initWithNibName:@"ZYZuoPinShengheViewController" bundle:nil];
        [self.navigationController pushViewController:selectKDVC animated:YES];
    };
}


@end
