//
//  ZYRankingTableViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/9.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYRankingTableViewController.h"
#import "ZYRankingTableViewCell.h"
@interface ZYRankingTableViewController ()

@end

@implementation ZYRankingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"星币排行";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYRankingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYRankingTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYRankingTableViewCell" owner:nil options:nil]firstObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

@end
