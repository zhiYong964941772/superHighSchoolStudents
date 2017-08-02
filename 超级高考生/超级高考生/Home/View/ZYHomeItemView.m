//
//  ZYHomeItemView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYHomeItemView.h"

@implementation ZYHomeItemView
+(instancetype)showItemView{
    ZYHomeItemView *view = [[[NSBundle mainBundle]loadNibNamed:@"ZYHomeItemView" owner:self options:nil]firstObject];
    return view;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
