//
//  ZXConfirmOrderTableViewController.m
//  书城
//
//  Created by 好采猫 on 2017/8/4.
//  Copyright © 2017年 李三年. All rights reserved.
//

#import "ZXConfirmOrderTableViewController.h"

#import "ZXShuChengTableViewCell.h"
#import "ZXAddressTableViewController.h"


@interface ZXConfirmOrderTableViewController ()

@property (strong, nonatomic) IBOutlet UIView *headerAddressView;

@property (strong, nonatomic) IBOutlet UIView *footerOrderInfoView;
@property (strong, nonatomic) IBOutlet UIView *footerSubmitOrderView;
@property (strong, nonatomic) UIWindow * window;

@end


static NSString * const shuChengCellId = @"shuChengCellId";
@implementation ZXConfirmOrderTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"确认订单";
     [self.tableView registerNib:[UINib nibWithNibName:@"ZXShuChengTableViewCell" bundle:nil] forCellReuseIdentifier:shuChengCellId];
    
    self.tableView.tableHeaderView = _headerAddressView;
    self.tableView.tableFooterView = _footerOrderInfoView;
    
    
}

- (void)loadFooterSubmitOrderView
{
    UIWindow * window = [[UIApplication sharedApplication]keyWindow];
    _window = window;
    
    _footerSubmitOrderView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 57 , [UIScreen mainScreen].bounds.size.width, 57);
    
    [window addSubview:_footerSubmitOrderView];
}


#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZXShuChengTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shuChengCellId];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZXShuChengTableViewCell" owner:nil options:nil]firstObject];
       
    }
    cell.ShoppingCarBtn.hidden = YES;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (IBAction)choosAddressBtnClick:(UIButton *)sender
{
    
    NSLog(@"添加和更换地址");
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadFooterSubmitOrderView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.footerSubmitOrderView removeFromSuperview];
}

- (IBAction)chooseAddressClick:(UIButton *)sender
{
    
    NSLog(@"选择收货地址");
    ZXAddressTableViewController *vc = [[ZXAddressTableViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)addCount:(UIButton *)sender {
    NSLog(@"  + 1   ");
}

- (IBAction)subCount:(UIButton *)sender {
    NSLog(@"  - 1   ");
}

- (IBAction)sumbmitOrderClick:(UIButton *)sender
{
    
    NSLog(@"提交订单");
}

@end
