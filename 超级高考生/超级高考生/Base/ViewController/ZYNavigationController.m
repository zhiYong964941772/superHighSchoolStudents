//
//  HWNavigationController.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ZYNavigationController.h"
#import "UIBarButtonItem+Extension.h"
@interface ZYNavigationController ()

@end

@implementation ZYNavigationController
+ (void)initialize
{
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}
- (void)setIsShowNavigation:(BOOL)isShowNavigation{
    _isShowNavigation = isShowNavigation;
    if (_isShowNavigation == YES) {
        [NSNOTIFICATION addObserver:self selector:@selector(zy_pushUserView) name:@"ZY_UserView" object:nil];
        [self.view addSubview:self.mNavigationView];
        [self.view addSubview:self.shuffingView];
        [self.mNavigationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.height.mas_equalTo(44);
        }];
        [self.shuffingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.mNavigationView.mas_bottom);
            make.height.mas_equalTo(SCREEN_HEIGHT/4);
        }];
    }else{
        [self.view addSubview:self.mNavigationSubView];
    }
}
- (void)zy_pushUserView{
    if (self.sp_PushUserView) {
        self.sp_PushUserView();
    }
}
/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"返回-黑" highImage:@"返回"];
        
        // 设置右边的更多按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
    }

    [super pushViewController:viewController animated:animated];
}

- (void)back
{
#warning 这里要用self，不是self.navigationController
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
    
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}
- (ZYNavigationView *)mNavigationView{
    if (!_mNavigationView) {
        _mNavigationView = [ZYNavigationView showNavigationView];
    }
    return _mNavigationView;
}
- (ZYNavigationSubView *)mNavigationSubView{
    if (!_mNavigationView) {
        _mNavigationSubView = [ZYNavigationSubView showNavigationSubView];
    }
    return _mNavigationSubView;
}
- (QuestionShufflingView *)shuffingView{
    if (!_shuffingView) {
       _shuffingView = [QuestionShufflingView getShuffingView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/4)];//无限轮播
        _shuffingView.imageArr =  @[@"轮播图.jpg",@"轮播图2.jpg",@"轮播图3.jpg"];
        _shuffingView.pageFrame = CGRectMake(_shuffingView.center.x - 20,CGRectGetMaxY(_shuffingView.bounds)-30, 40, 30);

    }
    return _shuffingView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
