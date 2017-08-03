//
//  HWTabBarViewController.h
//  黑马微博2期
//
//  Created by apple on 17-7-17.
//  Copyright (c) 2017年 heima. All rights reserved.
//  主控制器

#import <UIKit/UIKit.h>
@protocol ZYTab_VC_TCVDelegate <NSObject>

@optional
-(void)didOpenMenu:(UIView*)menu;
-(void)didCloseMenu:(UIView*)menu;

@end
@interface ZYTabBarViewController : UITabBarController
@property(strong, nonatomic)UIView *mMenuV;

@property(weak, nonatomic)id <ZYTab_VC_TCVDelegate> mDelegate;
@property(strong, nonatomic)UIPanGestureRecognizer *pan;

-(void)openMenu;
-(void)closeMenu;


@end
