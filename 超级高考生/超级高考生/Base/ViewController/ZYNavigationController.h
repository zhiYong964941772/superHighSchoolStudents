//
//  HWNavigationController.h
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionShufflingView.h"
#import "ZYNavigationSubView.h"
#import "ZYNavigationView.h"

@interface ZYNavigationController : UINavigationController
@property(assign, nonatomic)BOOL isShowNavigation;
@property(copy, nonatomic)void (^sp_PushUserView)();
@property(strong, nonatomic)QuestionShufflingView *shuffingView;
@property(strong, nonatomic)ZYNavigationSubView *mNavigationSubView;
@property(strong, nonatomic)ZYNavigationView *mNavigationView;



@end
