//
//  ZYUserHeaderView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYUserHeaderView.h"

@implementation ZYUserHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)myChengZhang:(id)sender {
    [ZHI_NSNotificationCenter postNotificationName:@"zy_ChengZhang" object:nil];

}
- (IBAction)erweima:(id)sender {
    [ZHI_NSNotificationCenter postNotificationName:@"zy_ErWeiMa" object:nil];

}
- (IBAction)myZiLiao:(id)sender {
    [ZHI_NSNotificationCenter postNotificationName:@"zy_ZiLiao" object:nil];

}

@end
