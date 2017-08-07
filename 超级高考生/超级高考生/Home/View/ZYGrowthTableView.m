//
//  ZYGrowthTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/2.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYGrowthTableView.h"
#import "ZYGrowthTableViewCell.h"
@interface ZYGrowthTableView() 

@end

@implementation ZYGrowthTableView
+(instancetype)showView:(CGRect)frame{
    ZYGrowthTableView *tableView = [[ZYGrowthTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
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
    ZYGrowthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYGrowthTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYGrowthTableViewCell" owner:nil options:nil]firstObject];
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

    [UILabel makeLabel:^(UILabel *label) {
        [headerView addSubview:label];  
        label.addTextColor(BASECOLORL(200, 200, 200)).addTextFont(12).addText(@"—— 已获专业学分100 ——");
        [label setTextAlignment:NSTextAlignmentCenter];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(headerView.mas_centerX);
            make.centerY.mas_equalTo(headerView.mas_centerY);
         }];
    }];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellTapBlock) {
        self.cellTapBlock(@1);
    }
}
@end

