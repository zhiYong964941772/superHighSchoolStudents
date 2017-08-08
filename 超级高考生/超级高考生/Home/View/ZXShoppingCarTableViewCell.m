//
//  ZXShoppingCarTableViewCell.m
//  书城
//
//  Created by 好采猫 on 2017/8/3.
//  Copyright © 2017年 李三年. All rights reserved.
//

#import "ZXShoppingCarTableViewCell.h"



@implementation ZXShoppingCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)chooseButton:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}
- (IBAction)addCount:(UIButton *)sender {
    
    NSLog(@"+1");
    
}
- (IBAction)subCount:(UIButton *)sender {
    
    NSLog(@"-1");
}

@end
