//
//  ZXAddressTableViewController.m
//  书城
//
//  Created by 好采猫 on 2017/8/4.
//  Copyright © 2017年 李三年. All rights reserved.
//

#import "ZXAddressTableViewController.h"
#import "ZXAddressTableViewCell.h"

#import "ZXManageAddressTableViewController.h"

@interface ZXAddressTableViewController ()

@end

static NSString *const addressCellId = @"addressCellId";

@implementation ZXAddressTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"收货地址";
    [self.tableView registerNib:[UINib nibWithNibName:@"ZXAddressTableViewCell" bundle:nil] forCellReuseIdentifier:addressCellId];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"管理" style:UIBarButtonItemStylePlain target:self action:@selector(manageAdderss)];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
}

-(void)manageAdderss
{
#warning 请自定义Item
    NSLog(@"管理地址");
    ZXManageAddressTableViewController *va = [[ZXManageAddressTableViewController alloc]init];
    
    [self.navigationController pushViewController:va animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:addressCellId];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZXAddressTableViewCell" owner:nil options:nil]firstObject];
        
    }
    
    if (indexPath.row != 0) {
        cell.addressIconLabel.hidden = YES;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}
@end
