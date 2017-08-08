//
//  ZXManageAddressTableViewController.m
//  书城
//
//  Created by 好采猫 on 2017/8/4.
//  Copyright © 2017年 李三年. All rights reserved.
//

#import "ZXManageAddressTableViewController.h"
#import "ZXManageAddressTableViewCell.h"
#import "ZXAddOrEditAddressViewController.h"

@interface ZXManageAddressTableViewController ()

@property (strong, nonatomic) IBOutlet UIView *addNewAddressView;

@property (strong, nonatomic) UIWindow * window;

@end

static NSString *const manageAddressCellId = @"manageAddressCellId";

@implementation ZXManageAddressTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"收货地址管理";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZXManageAddressTableViewCell" bundle:nil] forCellReuseIdentifier:manageAddressCellId];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
}

-(void)loadNewAddressView{
    
    UIWindow *window = [[UIApplication sharedApplication]keyWindow];
    
    _window = window;
    
    _addNewAddressView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49 , [UIScreen mainScreen].bounds.size.width, 49);
    
    [window addSubview:_addNewAddressView];
    
    
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
    ZXManageAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:manageAddressCellId];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZXManageAddressTableViewCell" owner:nil options:nil]firstObject];
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (IBAction)addNewAddressClick:(UIButton *)sender
{
    NSLog(@"添加新地址");
    ZXAddOrEditAddressViewController * vc = [[ZXAddOrEditAddressViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_addNewAddressView removeFromSuperview];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     [self loadNewAddressView];
}

@end
