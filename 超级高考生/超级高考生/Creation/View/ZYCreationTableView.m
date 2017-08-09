//
//  ZYCreationTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYCreationTableView.h"
#import "ZYCreationTableViewCell.h"

@interface ZYCreationTableView() 

@end

@implementation ZYCreationTableView
+(instancetype)showView:(CGRect)frame{
    ZYCreationTableView *tableView = [[ZYCreationTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
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
    ZYCreationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYCreationTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYCreationTableViewCell" owner:nil options:nil]firstObject];
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
    
    UILabel *titleLB = [UILabel makeLabel:^(UILabel *label) {
        [headerView addSubview:label];
        label.addTextFont(14).addText(@"审核中创作");
        [label setTextAlignment:NSTextAlignmentCenter];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(headerView.mas_centerX);
            make.centerY.mas_equalTo(headerView.mas_centerY);
        }];
    }];
    [UIImageView makeImage:^(UIImageView * _Nullable imageView) {
        [headerView addSubview:imageView];
        imageView.addColor([UIColor grayColor]);
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(titleLB.mas_bottom).with.offset(3 );
            make.centerX.mas_equalTo(headerView.mas_centerX);
            make.width.mas_equalTo(30);
            
            make.height.mas_equalTo(1);
        }];
    }];
    [UIButton makeButtonWithBlock:^(UIButton *button) {
        [headerView addSubview:button];
        button.addTextFont(14).addTargetAction(self,@"zy_guizeAction").addTextColor(BASECOLORL(220, 220, 220)).addText(@"审核规则");
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(headerView.mas_centerY);
        }];
    }];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (void)zy_guizeAction{
    if (self.zy_guizheBlock) {
        self.zy_guizheBlock();
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellTapBlock) {
        self.cellTapBlock(@"");
    }
}
@end
