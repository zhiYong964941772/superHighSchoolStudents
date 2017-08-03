//
//  ZYKaoDianTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/3.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYKaoDianTableView.h"

#import "ZYKaoDianTableViewCell.h"
@interface ZYKaoDianTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZYKaoDianTableView
+(instancetype)showKaoDianView:(CGRect)frame{
    ZYKaoDianTableView *tableView = [[ZYKaoDianTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
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
    ZYKaoDianTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYKaoDianTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYKaoDianTableViewCell" owner:nil options:nil]firstObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
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
