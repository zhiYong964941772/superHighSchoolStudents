//
//  ZYJingPingSelectTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/9.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYJingPingSelectTableView.h"
#import "ZYJingPingSelectTableViewCell.h"
@implementation ZYJingPingSelectTableView
+(instancetype)showView:(CGRect)frame{
    ZYJingPingSelectTableView *tableView = [[ZYJingPingSelectTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    return tableView;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
        
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYJingPingSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYJingPingSelectTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYJingPingSelectTableViewCell" owner:nil options:nil]firstObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    [UIButton makeButtonWithBlock:^(UIButton *button) {
        [headerView addSubview:button];
        button.addTextFont(14).addTargetAction(self,@"zhuangye").addTextColor([UIColor whiteColor]).addText(@"专业");
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(headerView.mas_centerY);
            make.centerX.mas_equalTo(headerView.mas_centerX).with.offset(-30);
        }];
    }];
    [UIButton makeButtonWithBlock:^(UIButton *button) {
        [headerView addSubview:button];
        button.addTextFont(14).addTargetAction(self,@"renwen").addTextColor([UIColor whiteColor]).addText(@"人文");
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(headerView.mas_centerY);
            make.centerX.mas_equalTo(headerView.mas_centerX).with.offset(+30);

        }];
    }];

    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellTapBlock) {
        self.cellTapBlock(@"");
    }
}

@end
