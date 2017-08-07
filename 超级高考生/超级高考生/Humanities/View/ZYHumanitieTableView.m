//
//  ZYHumanitieTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYHumanitieTableView.h"
#import "ZYHumanitieTableViewCell.h"
@interface ZYHumanitieTableView() 

@end

@implementation ZYHumanitieTableView
+(instancetype)showView:(CGRect)frame{
    ZYHumanitieTableView *tableView = [[ZYHumanitieTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
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
    ZYHumanitieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYHumanitieTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYHumanitieTableViewCell" owner:nil options:nil]firstObject];
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
        label.addTextFont(16).addText(@"专题");
       [label setTextAlignment:NSTextAlignmentCenter];
       [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(headerView.mas_centerX);
            make.centerY.mas_equalTo(headerView.mas_centerY);
            make.width.mas_equalTo(40);
        }];
    }];
    [UIImageView makeImage:^(UIImageView * _Nullable imageView) {
        [headerView addSubview:imageView];
        imageView.addColor([UIColor grayColor]);
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(titleLB.mas_bottom);
            make.centerX.mas_equalTo(headerView.mas_centerX);
            make.left.mas_equalTo(titleLB.mas_left);
            make.right.mas_equalTo(titleLB.mas_right);

            make.height.mas_equalTo(1);
        }];
    }];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
@end
