//
//  ZYCreationTableView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYCreationTableView.h"
#import "ZYCreationTableViewCell.h"

@interface ZYCreationTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZYCreationTableView
+(instancetype)showCreationView:(CGRect)frame{
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
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

@end
