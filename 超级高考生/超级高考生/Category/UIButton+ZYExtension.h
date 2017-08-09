//
//  UIButton+ZYExtension.h
//  FunBox
//
//  Created by 破零0000 on 2017/7/19.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZYExtension)
+ (instancetype)makeButtonWithBlock:(void(^)(UIButton *button))makeButton;
- ( UIButton * (^)(CGRect rect))addFrame;
- ( UIButton * (^)(CGFloat font))addTextFont;
- ( UIButton * (^)(UIColor *bgColor))addBgColor;
- ( UIButton * (^)(UIColor *textColor ,UIControlState state))addStateTextColor;
- ( UIButton * (^)(NSString *image,UIControlState state))addStateImage;
- ( UIButton * (^)(NSString *bgImage,UIControlState state))addStateBgImage;
- ( UIButton * (^)(UIColor *textColor))addTextColor;
- ( UIButton * (^)(NSString *image))addImage;
- ( UIButton * (^)(NSString *bgImage))addBgImage;
- ( UIButton * (^)(NSString *text))addText;
- ( UIButton * (^)(NSString *text ,UIControlState state))addStateText;
- ( UIButton * (^)(id Obj ,NSString *targetName))addTargetAction;

@end
