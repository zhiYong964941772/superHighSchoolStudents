//
//  ZYProfessionItemView.h
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYProfessionItemView : UIView
+ (instancetype)showItemViewWithBtnAction:(void(^)(ZYProfessionItemView *view))view;
@property (nonatomic ,copy)void(^zy_DaKa)();
@property (nonatomic ,copy)void(^zy_JiaoXue)();
@property (nonatomic ,copy)void(^zy_YaZhou)();
@property (nonatomic ,copy)void(^zy_JiaoPei)();

@end
