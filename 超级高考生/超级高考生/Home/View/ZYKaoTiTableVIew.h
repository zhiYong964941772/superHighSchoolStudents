//
//  ZYKaoTiTableVIew.h
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/3.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYKaoTiTableVIew : UITableView
@property (nonatomic ,copy)void(^cellTapBlock)(id data);
+(instancetype)showKaoTiView:(CGRect)frame;
@end
