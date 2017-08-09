//
//  ZYProfessionItemView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYProfessionItemView.h"

@implementation ZYProfessionItemView
+(instancetype)showItemViewWithBtnAction:(void (^)(ZYProfessionItemView *))view{
    ZYProfessionItemView *profession = [[[NSBundle mainBundle]loadNibNamed:@"ZYProfessionItemView" owner:self options:nil]firstObject];
    view(profession);
    return profession;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)daka:(id)sender {
    if (self.zy_DaKa) {
        self.zy_DaKa();
    }
}
- (IBAction)jiaoxue:(id)sender {
    if (self.zy_JiaoXue) {
        self.zy_JiaoXue();
    }
}
- (IBAction)yazhou:(id)sender {
    if (self.zy_YaZhou) {
        self.zy_YaZhou();
    }
}
- (IBAction)jiaopei:(id)sender {
    if (self.zy_JiaoPei) {
        self.zy_JiaoPei();
    }
}
@end
