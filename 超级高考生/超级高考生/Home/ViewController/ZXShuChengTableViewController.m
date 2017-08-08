//
//  ZXShuChengTableViewController.m
//  书城
//
//  Created by 好采猫 on 2017/8/3.
//  Copyright © 2017年 李三年. All rights reserved.
//

#import "ZXShuChengTableViewController.h"
#import "ZXShuChengTableViewCell.h"

#import "ZXBooksInfoTableViewController.h"

@interface ZXShuChengTableViewController ()

@end

static NSString * const shuChengCellId = @"shuChengCellId";

@implementation ZXShuChengTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"书城";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZXShuChengTableViewCell" bundle:nil] forCellReuseIdentifier:shuChengCellId];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZXShuChengTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shuChengCellId];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZXShuChengTableViewCell" owner:nil options:nil]firstObject];
        
    }
    cell.buyCount.hidden = YES;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXBooksInfoTableViewController * vc = [[ZXBooksInfoTableViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
