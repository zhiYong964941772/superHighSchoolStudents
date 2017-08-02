//
//  ZYUserTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYUserTableView.h"
#import "ZYUserTableViewCell.h"
#import "ZYUserHeaderView.h"
@interface ZYUserTableView()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *listControl;
    NSMutableArray *listImage;
}
@end

@implementation ZYUserTableView
+(instancetype)showUserView{
    ZYUserTableView *tableView = [[ZYUserTableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    return tableView;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        listControl = [NSMutableArray arrayWithArray:@[@"我的钱包",@"我的问答",@"我的订单",@"我的收藏",@"设置"]];
        

    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return listControl.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYUserTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYUserTableViewCell" owner:nil options:nil]firstObject];
    }
    cell.cellTitle = listControl[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZYUserHeaderView *header = [[[NSBundle mainBundle]loadNibNamed:@"ZYUserHeaderView" owner:nil options:nil]firstObject];
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 290;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
