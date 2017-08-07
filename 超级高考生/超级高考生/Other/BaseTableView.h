//
//  BaseTableView.h
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/4.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
+(instancetype)showView:(CGRect)frame;
@property (nonatomic ,copy)void(^cellTapBlock)(id data);

@end
