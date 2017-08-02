//
//  ZYProfessionCollectionViewCell.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYProfessionCollectionViewCell.h"
@interface ZYProfessionCollectionViewCell()

@end
@implementation ZYProfessionCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}
- (void)creatUI{
    UIImageView *imageView = [UIImageView makeImage:^(UIImageView * _Nullable imageView) {
        [self.contentView addSubview:imageView];
        imageView.backgroundColor = [UIColor grayColor];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(100);
            make.top.mas_equalTo(0);
        }];
    }];
   UILabel *titleLb = [UILabel makeLabel:^(UILabel *label) {
        [self.contentView addSubview:label];
        label.addTextColor([UIColor blackColor]).addTextFont(15).addText(@"命题者思维");
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_left);
            make.right.mas_equalTo(imageView.mas_right);
            make.top.mas_equalTo(imageView.mas_bottom).with.offset(10);
            make.height.mas_equalTo(30);
        }];
    }];
    
    [UILabel makeLabel:^(UILabel *label) {
        [self.contentView addSubview:label];
        label.addTextColor([UIColor grayColor]).addTextFont(12).addText(@"1234人观看");
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLb.mas_left);
            make.right.mas_equalTo(titleLb.mas_right);
            make.top.mas_equalTo(titleLb.mas_bottom);
            make.height.mas_equalTo(30);
        }];
    }];

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
