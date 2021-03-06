//
//  ZYBiJiDetailsViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/7.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYBiJiDetailsViewController.h"
#import "ZYBiJiDetailsTableView.h"
#import "KxMenu.h"
@interface ZYBiJiDetailsViewController ()
@property (nonatomic ,strong)ZYBiJiDetailsTableView *tableView;

@end

@implementation ZYBiJiDetailsViewController
- (ZYBiJiDetailsTableView *)tableView{
    if (!_tableView) {
        _tableView = [ZYBiJiDetailsTableView showView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self  cellEvent];
    [self setTitle:@"笔记详情"];
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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"分类选择"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(zy_showMemu:event:)];
}

- (void)cellEvent{
    @weakify(self);
    self.tableView.cellTapBlock = ^(id data) {
        @strongify(self);
        
        
    };
}
- (void)zy_showMemu:(UIBarButtonItem *)item event:(UIEvent *)event{
    NSArray *menuItem = @[[KxMenuItem menuItem:@"考点一" image:nil target:self action:NULL],[KxMenuItem menuItem:@"考点二" image:nil target:self action:NULL],[KxMenuItem menuItem:@"考点三" image:nil target:self action:NULL]];
    CGRect frame = [[event.allTouches anyObject]view].frame;
    frame.origin.y +=20;
    [KxMenu showMenuInView:[UIApplication sharedApplication].keyWindow fromRect:frame menuItems:menuItem];
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
