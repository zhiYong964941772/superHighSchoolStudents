//
//  ZXBooksInfoTableViewController.m
//  书城
//
//  Created by 好采猫 on 2017/8/3.
//  Copyright © 2017年 李三年. All rights reserved.
//

#import "ZXBooksInfoTableViewController.h"
#import "ZXShoppingCarTableViewController.h"

#import "ZXConfirmOrderTableViewController.h"

@interface ZXBooksInfoTableViewController ()

@property (strong, nonatomic) IBOutlet UIView *bookInfoHeaderView;
@property (strong, nonatomic) IBOutlet UIView *shoppingCarView;

@property (weak, nonatomic) UIWindow *window;
@end

@implementation ZXBooksInfoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"高考数学超级备考攻略";
    
    self.tableView.tableHeaderView = _bookInfoHeaderView;
    
    
}

- (void)loadShoppingCarView
{
    UIWindow * window = [[UIApplication sharedApplication]keyWindow];
    _window = window;
    
    _shoppingCarView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 57 , [UIScreen mainScreen].bounds.size.width, 57);
    
    [window addSubview:_shoppingCarView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 0;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self loadShoppingCarView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.shoppingCarView removeFromSuperview];
    
    
}

- (IBAction)buyNow:(UIButton *)sender {
    
    NSLog(@"立即购买");
    ZXConfirmOrderTableViewController * vc = [[ZXConfirmOrderTableViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)addToShoppingCar:(UIButton *)sender {
    
    NSLog(@"加入购物车");
}

- (IBAction)showShoppingCar {
    
    NSLog(@"查看购物车");
    ZXShoppingCarTableViewController * vc = [[ZXShoppingCarTableViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];

}

- (IBAction)likeClick:(UIButton *)sender {
    NSLog(@"点赞");
}

- (IBAction)shareClick:(UIButton *)sender {
    NSLog(@"分享");
}


@end
