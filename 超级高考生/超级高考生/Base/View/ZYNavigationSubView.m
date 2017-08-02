//
//  ZYNavigationSubView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYNavigationSubView.h"

@implementation ZYNavigationSubView
+(instancetype)showNavigationSubView{
    ZYNavigationSubView *mNavigationSubView = [[[NSBundle mainBundle]loadNibNamed:@"ZYNavigationSubView" owner:self options:nil]firstObject];
    [mNavigationSubView setFrame:CGRectMake(0,20, SCREEN_WIDTH, 180)];
    
    return mNavigationSubView;
    
}
- (IBAction)userAction:(UIButton *)sender {
    [NSNOTIFICATION postNotificationName:@"ZY_UserView" object:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
