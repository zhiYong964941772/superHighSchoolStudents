//
//  ZYGouWuCheTool.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/4.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYGouWuCheTool.h"

@implementation ZYGouWuCheTool

+(instancetype)showGouWuChe:(void (^)( ZYGouWuCheTool*view))btnBlock{
    ZYGouWuCheTool *view = [[[NSBundle mainBundle]loadNibNamed:@"ZYGouWuCheTool" owner:self options:nil]firstObject];
    btnBlock(view);
    return view;
}

@end
