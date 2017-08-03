//
//  ZYGrowthXueFenTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/3.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYGrowthXueFenTableView.h"
#import "ZYGrowthXueFenTableViewCell.h"

@interface ZYGrowthXueFenTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZYGrowthXueFenTableView
+(instancetype)showGrowthXueFenView:(CGRect)frame{
    ZYGrowthXueFenTableView *tableView = [[ZYGrowthXueFenTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
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
    ZYGrowthXueFenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYGrowthXueFenTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYGrowthXueFenTableViewCell" owner:nil options:nil]firstObject];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellTapBlock) {
        self.cellTapBlock(@1);
    }
}
@end

