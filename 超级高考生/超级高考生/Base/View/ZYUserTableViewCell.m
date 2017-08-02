//
//  ZYUserTableViewCell.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYUserTableViewCell.h"
@interface ZYUserTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UIImageView *moneyImage;
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;

@end
@implementation ZYUserTableViewCell
- (void)setCellTitle:(NSString *)cellTitle{
    _cellTitle = cellTitle;
    self.title.addText(cellTitle);
    [self.titleImage setImage:[UIImage imageNamed:cellTitle]];
    if ([cellTitle isEqualToString:@"我的钱包"]) {
        [self.money setAlpha:1.0];
        [self.moneyImage setAlpha:1.0];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
