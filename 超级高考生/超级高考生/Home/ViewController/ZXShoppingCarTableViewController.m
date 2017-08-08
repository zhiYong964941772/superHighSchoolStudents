//
//  ZXShoppingCarTableViewController.m
//  书城
//
//  Created by 好采猫 on 2017/8/3.
//  Copyright © 2017年 李三年. All rights reserved.
//

#import "ZXShoppingCarTableViewController.h"
#import "ZXShoppingCarTableViewCell.h"
#import "ZXConfirmOrderTableViewController.h"

@interface ZXShoppingCarTableViewController ()

@property (strong, nonatomic) IBOutlet UIView *footerMoneyView;
@property (strong, nonatomic) IBOutlet UIView *footerDeleteView;
@property (strong, nonatomic) UIWindow * window;

@end

static NSString * const shoppingCarCellId = @"shoppingCarCellId";

@implementation ZXShoppingCarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购物车";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZXShoppingCarTableViewCell" bundle:nil] forCellReuseIdentifier:shoppingCarCellId];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightEditItem)];
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    [self LoadFooterMoneyView];
}

-(void)rightEditItem
{
#warning 请自定义ButtonItem
    _footerDeleteView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 51 , [UIScreen mainScreen].bounds.size.width, 51);
    [_window addSubview:_footerDeleteView];
}

-(void)LoadFooterMoneyView
{
    
    UIWindow * window = [[UIApplication sharedApplication]keyWindow];
    _window = window;
    
    _footerMoneyView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 51 , [UIScreen mainScreen].bounds.size.width, 51);
    
    [window addSubview:_footerMoneyView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXShoppingCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shoppingCarCellId];
    
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZXShuChengTableViewCell" owner:nil options:nil]firstObject];
        
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.footerMoneyView removeFromSuperview];
    [self.footerDeleteView removeFromSuperview];
}

//结算
- (IBAction)payMoney:(UIButton *)sender {
    
    ZXConfirmOrderTableViewController * vc = [[ZXConfirmOrderTableViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
