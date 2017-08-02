//
//  QuestionShufflingView.h
//  Dragons
//
//  Created by lai on 16/4/18.
//  Copyright © 2016年 赖.志勇 All rights reserved.
//
//** 在哪里添加了本控件,就在那个VC设置self.automaticallyAdjustsScrollViewInsets = NO;*/
#import <UIKit/UIKit.h>
@interface QuestionShufflingView : UIView
//**初始化方法*/
+ (instancetype)getShuffingView:(CGRect)shuffyFrame;
//**imageArr自定义本地图片*/
@property (nonatomic, strong) NSArray *imageArr;
//** 关掉scrollView  */
- (void)hideShuffing;
//** 设置page的frame  */
@property (nonatomic, assign) CGRect pageFrame;

@end
