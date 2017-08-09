//
//  ZYChengGuoViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/9.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYChengGuoViewController.h"
#import "ZYChengGuoTableView.h"
#import "ZYRankingTableViewController.h"
@interface ZYChengGuoViewController ()

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic ,strong)ZYChengGuoTableView *tableView;

@end
@implementation ZYChengGuoViewController
- (ZYChengGuoTableView *)tableView{
    if (!_tableView) {
        _tableView = [ZYChengGuoTableView showView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _tableView;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self  cellEvent];
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"我的成果";
}
- (void)creatUI{
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.headerView.mas_bottom);
    }];
    //    jianjieSize = [self.jianjieLB.text sizeWithFont:[UIFont systemFontOfSize:12] maxW:SCREEN_WIDTH - 20];
    
}
- (IBAction)chengguoRanking:(id)sender {
    ZYRankingTableViewController *rtvc = [[ZYRankingTableViewController alloc]init];
    [self.navigationController pushViewController:rtvc animated:YES];
}

- (void)cellEvent{
    @weakify(self);
    self.tableView.cellTapBlock = ^(id data) {
        @strongify(self);
        
    };
}


@end
