
//
//  UIButton+ZYExtension.m
//  FunBox
//
//  Created by 破零0000 on 2017/7/19.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "UIButton+ZYExtension.h"

@implementation UIButton (ZYExtension)
+ (instancetype)makeButtonWithBlock:(void (^)(UIButton *))makeButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    makeButton(button);
    return button;
}
- (UIButton *(^)(CGRect))addFrame{
    return ^(CGRect frame){
        [self setFrame:frame];
        return self;
    };
}
- (UIButton *(^)(NSString *))addText{
    return ^(NSString *title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(NSString *, UIControlState))addStateText{
    return ^(NSString *title ,UIControlState state){
        [self setTitle:title forState:state];
        return self;
    };
}
- (UIButton *(^)(NSString *))addImage{
    return ^(NSString *image){
        [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        return self;
    };

}
- (UIButton *(^)(NSString *, UIControlState))addStateImage{
    return ^(NSString *image ,UIControlState state){
        [self setImage:[UIImage imageNamed:image] forState:state];
        return self;
    };
}
- (UIButton *(^)(NSString *))addBgImage{
    return ^(NSString *image){
        [self setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(NSString *, UIControlState))addStateBgImage{
    return ^(NSString *image ,UIControlState state){
        [self setBackgroundImage:[UIImage imageNamed:image] forState:state];
        return self;
    };

}
- (UIButton *(^)(id, NSString *))addTargetAction{
    return ^(id obj ,NSString *actionName){
        if (!obj) return self;
        const char *name = actionName.UTF8String;
        SEL action = sel_registerName(name);
        [self addTarget:obj action:action forControlEvents:UIControlEventTouchUpInside];
        return self;
    };

}
- (UIButton *(^)(UIColor *))addTextColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(UIColor *, UIControlState))addStateTextColor{
    return ^(UIColor *color , UIControlState state){
        [self setTitleColor:color forState:state];
        return self;
    };
}
- (UIButton *(^)(CGFloat))addTextFont{
    return ^(CGFloat font){
        self.titleLabel.addTextFont(font);
        return self;
    };
}
- (UIButton *(^)(UIColor *))addBgColor{
    return ^(UIColor *bgColor){
        [self setBackgroundColor:bgColor];
        return self;
    };

}
@end
