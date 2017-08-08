//
//  ZXManageAddressTableViewCell.m
//  书城
//
//  Created by 好采猫 on 2017/8/4.
//  Copyright © 2017年 李三年. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ZXManageAddressTableViewCell.h"

@implementation ZXManageAddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)editAddressClick:(UIButton *)sender
{
#warning 通知控制器跳转？？？
    NSLog(@"#warning 通知控制器跳转？？？");
}

@end
