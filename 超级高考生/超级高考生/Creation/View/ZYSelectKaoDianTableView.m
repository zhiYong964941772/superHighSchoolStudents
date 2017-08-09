//
//  ZYSelectKaoDianTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/9.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYSelectKaoDianTableView.h"
#import "ZYSelectKaoDianTableViewCell.h"
@implementation ZYSelectKaoDianTableView
+(instancetype)showView:(CGRect)frame{
    ZYSelectKaoDianTableView *tableView = [[ZYSelectKaoDianTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
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
    ZYSelectKaoDianTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYSelectKaoDianTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYSelectKaoDianTableViewCell" owner:nil options:nil]firstObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellTapBlock) {
        self.cellTapBlock(@"");
    }
}


@end
