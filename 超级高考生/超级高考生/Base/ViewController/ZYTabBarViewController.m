//
//  HWTabBarViewController.m
//  赖志勇
//
//  Created by apple on 17-7-17.
//  Copyright (c) 2017年 heima. All rights reserved.
//

#import "ZYTabBarViewController.h"
#import "ZYHomeViewController.h"
#import "ZYProfessionalViewController.h"
#import "ZYHumanitiesViewController.h"
#import "ZYCreationViewController.h"
#import "ZYNavigationController.h"
#import "ZYUserTableView.h"
//#import "HWTabBar.h"
@interface ZYTabBarViewController ()
{
    CGFloat _centerMaxX;
}
@property(strong, nonatomic)UIView *mTransitionView;
@property(strong, nonatomic)ZYUserTableView *mUserTableView;

@property(strong, nonatomic)UITapGestureRecognizer *mTapGester;
@property(assign, nonatomic)BOOL mMenuIsOpen;

@property(strong, nonatomic)UITabBar *mTabBar;


@end

@implementation ZYTabBarViewController
#define MainColor BASECOLORL(89, 167, 243)
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.初始化子控制器
    ZYHomeViewController *home = [[ZYHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"形状-2-拷贝" selectedImage:@"形状-2"];
    
    ZYProfessionalViewController *game = [[ZYProfessionalViewController alloc] init];
    [self addChildVc:game title:@"专业" image:@"矢量智能对象@2x_99" selectedImage:@"矢量智能对象-拷贝"];
    
    ZYHumanitiesViewController *ranking = [[ZYHumanitiesViewController alloc] init];
    [self addChildVc:ranking title:@"人文" image:@"形状-7-拷贝-2" selectedImage:@"形状-7"];
    
    ZYCreationViewController *message = [[ZYCreationViewController alloc] init];
    [self addChildVc:message title:@"创作" image:@"矢量智能对象-拷贝-2@2x_35" selectedImage:@"矢量智能对象@2x_76"];
    
    
//    // 2.更换系统自带的tabbar
//    HWTabBar *tabBar = [[HWTabBar alloc] init];
//    [self setValue:tabBar forKeyPath:@"tabBar"];
    /*
     [self setValue:tabBar forKeyPath:@"tabBar"];相当于self.tabBar = tabBar;
     [self setValue:tabBar forKeyPath:@"tabBar"];这行代码过后，tabBar的delegate就是HWTabBarViewController
     说明，不用再设置tabBar.delegate = self;
     */
    
    /*
     1.如果tabBar设置完delegate后，再执行下面代码修改delegate，就会报错
     tabBar.delegate = self;

     2.如果再次修改tabBar的delegate属性，就会报下面的错误
     错误信息：Changing the delegate of a tab bar managed by a tab bar controller is not allowed.
     错误意思：不允许修改TabBar的delegate属性(这个TabBar是被TabBarViewController所管理的)
     */
    self.view.backgroundColor = [UIColor whiteColor];
    _mMenuIsOpen = NO;
    _centerMaxX = SCREEN_WIDTH*3/2-80.0f;
    [self initMTransitionView];
    
    [self addGestureForMTransitionView];
    
   
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//选中时的按钮显示
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = BASECOLORL(132, 132, 138);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = MainColor;
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    ZYNavigationController *nav = [[ZYNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    nav.sp_PushUserView = ^{
        [self changeMtransitionView];
    };
    if (![title isEqualToString:@"创作"]) {
        [nav setIsShowNavigation:YES];
    }else{
        [nav setIsShowNavigation:NO];

    }
    [self addChildViewController:nav];
}

//#pragma mark - HWTabBarDelegate代理方法
//- (void)tabBarDidClickPlusButton:(HWTabBar *)tabBar
//{
//    HWComposeViewController *vc = [[HWComposeViewController alloc] init];
//    HWNavigationController *navi = [[HWNavigationController alloc]initWithRootViewController:vc];
//    
//    [self presentViewController:navi animated:YES completion:nil];
//}
#pragma mark 菜单懒加载
-(void)setMMenuV:(UIView *)mMenuV{
    if (mMenuV!=nil) {
        _mMenuV = mMenuV;
        [self.view insertSubview:_mMenuV atIndex:0];
    }
}

#pragma mark 打开菜单
-(void)openMenu{
    
    CGPoint center = self.mTransitionView.center;
    center.x = _centerMaxX;
    [UIView animateWithDuration:0.15f animations:^{
        self.mTransitionView.center = center;
        if (_mDelegate != nil&& [_mDelegate respondsToSelector:@selector(didOpenMenu:)]) {
            [_mDelegate didOpenMenu:_mMenuV];
        }
    }];
    [self mTransitionSubViewsEnable:NO];
}
#pragma mark 关闭菜单
-(void)closeMenu{
    
    CGPoint center = self.mTransitionView.center;
    center.x = SCREEN_WIDTH/2;
    [UIView animateWithDuration:0.15f animations:^{
        self.mTransitionView.center = center;
    } completion:^(BOOL finished) {
        [self mTransitionSubViewsEnable:YES];
        if (_mDelegate != nil&& [_mDelegate respondsToSelector:@selector(didCloseMenu:)]) {
            [_mDelegate didCloseMenu:_mMenuV];
        }
    }];
}

#pragma mark Transition用户交互使能
-(void)mTransitionSubViewsEnable:(BOOL)enable{
    for (UIView *tmp in self.mTransitionView.subviews) {
        tmp.userInteractionEnabled = enable;
    }
    if (enable) {
        [self.mTransitionView removeGestureRecognizer:_mTapGester];
    }else{
        [self.mTransitionView addGestureRecognizer:_mTapGester];
    }
}

#pragma mark 配置mTransitionView
-(void)initMTransitionView{
    for (UIView *tmp in self.view.subviews) {
        
        [tmp removeFromSuperview];
        
        [self.mTransitionView addSubview:tmp];
    }
    [self.view addSubview:self.mUserTableView];
    [self.view addSubview:self.mTransitionView];
}

#pragma mark 拖动手势动作
-(void)panAction:(UIPanGestureRecognizer*)pan{
    CGPoint location = [pan translationInView:pan.view.superview];
    CGPoint center = self.mTransitionView.center;
    
    if (pan.state==UIGestureRecognizerStateEnded) {
        if (center.x<_centerMaxX*0.5+SCREEN_WIDTH*0.25){
            [self closeMenu];
        }else{
            [self openMenu];
        }
    }else if(pan.state==UIGestureRecognizerStateChanged){
        
        if (location.x<0) {//向左滑
            center.x = center.x+location.x<=SCREEN_WIDTH/2? SCREEN_WIDTH/2 : center.x+location.x;
        }else{
            center.x = center.x+location.x>=_centerMaxX? _centerMaxX : center.x+location.x;
        }
        
        self.mTransitionView.center = center;
        [pan setTranslation:CGPointMake(0, 0) inView:pan.view.superview];
    }
}
- (void)changeMtransitionView{
    [self openMenu];
}
#pragma mark 添加手势
-(void)addGestureForMTransitionView{
    
    _pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [_mTransitionView addGestureRecognizer:_pan];
    
    _mTapGester = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
}

#pragma mark--懒加载
-(UIView *)mTransitionView{
    if (_mTransitionView==nil) {
        _mTransitionView = [[UIView alloc]initWithFrame:self.view.bounds];
    }
    return _mTransitionView;
}
- (ZYUserTableView *)mUserTableView{
    if (!_mUserTableView) {
        _mUserTableView = [ZYUserTableView showUserView];
    }
    return _mUserTableView;
}
-(void)tapAction{
    CGFloat x = _mTransitionView.center.x;
    if (x>=_centerMaxX) {
        [self closeMenu];
    }
}

@end
