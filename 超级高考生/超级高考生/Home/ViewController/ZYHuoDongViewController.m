//
//  ZYHuoDongViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/8.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYHuoDongViewController.h"
#import "ZYHuoDongTableView.h"
@interface ZYHuoDongViewController ()
@property (nonatomic ,strong)ZYHuoDongTableView *tableView;

@end

@implementation ZYHuoDongViewController
- (ZYHuoDongTableView *)tableView{
    if (!_tableView) {
        _tableView = [ZYHuoDongTableView showView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self  cellEvent];
    [self setTitle:@"全部活动"];
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
