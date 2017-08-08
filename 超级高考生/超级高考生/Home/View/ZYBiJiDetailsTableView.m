//
//  ZYBiJiDetailsTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/7.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYBiJiDetailsTableView.h"
#import "ZYBiJiDetailsTableViewCell.h"
@implementation ZYBiJiDetailsTableView
+(instancetype)showView:(CGRect)frame{
    ZYBiJiDetailsTableView *tableView = [[ZYBiJiDetailsTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
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
    ZYBiJiDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYBiJiDetailsTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYBiJiDetailsTableViewCell" owner:nil options:nil]firstObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellTapBlock) {
        self.cellTapBlock(@1);
    }
}



@end
