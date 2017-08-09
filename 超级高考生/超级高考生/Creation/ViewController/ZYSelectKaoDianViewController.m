//
//  ZYSelectKaoDianViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/9.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYSelectKaoDianViewController.h"
#import "ZYSelectKaoDianTableView.h"
#import "ZYAddJinPingViewController.h"
@interface ZYSelectKaoDianViewController ()
@property (nonatomic ,strong)ZYSelectKaoDianTableView *tableView;
@end

@implementation ZYSelectKaoDianViewController
- (ZYSelectKaoDianTableView *)tableView{
    if (!_tableView) {
        _tableView = [ZYSelectKaoDianTableView showView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self  cellEvent];
    [self setTitle:@"选择考点"];
}
- (void)creatUI{
    [self.view addSubview:self.tableView];
    
   UIButton *selectBtn = [UIButton makeButtonWithBlock:^(UIButton *button) {
        [self.view addSubview:button];
        button.addBgColor([UIColor blueColor]).addTextFont(14).addTargetAction(self,@"selectZhuanye").addTextColor([UIColor whiteColor]).addText(@"确定");
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view.mas_centerX);
            make.bottom.mas_equalTo(-40);
            
        }];
    }];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(selectBtn.mas_top).with.offset(40);
        make.top.mas_equalTo(0);
    }];
    //    jianjieSize = [self.jianjieLB.text sizeWithFont:[UIFont systemFontOfSize:12] maxW:SCREEN_WIDTH - 20];
    
}
- (void)selectZhuanye{
    ZYAddJinPingViewController *addJPVC = [[ZYAddJinPingViewController alloc]initWithNibName:@"ZYAddJinPingViewController" bundle:nil];
    addJPVC.title = @"添加精评";
    [self.navigationController pushViewController:addJPVC animated:YES];
}
- (void)cellEvent{
    @weakify(self);
    self.tableView.cellTapBlock = ^(id data) {
        @strongify(self);
        
    };
}

@end
