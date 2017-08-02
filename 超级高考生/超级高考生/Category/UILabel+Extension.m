//
//  UILabel+Extension.m
//  BeautifulBreastClub
//
//  Created by 潘东 on 2017/6/3.
//  Copyright © 2017年 BeautifulBreastClub. All rights reserved.
//

#import "UILabel+Extension.h"
@implementation UILabel (Extension)
- (void)setTextFont:(UIFont *)font atRange:(NSRange)range
{
    [self setTextAttributes:@{NSFontAttributeName : font}
                    atRange:range];
}

- (void)setTextColor:(UIColor *)color atRange:(NSRange)range
{
    [self setTextAttributes:@{NSForegroundColorAttributeName : color}
                    atRange:range];
}

- (void)setTextLineSpace:(float)space atRange:(NSRange)range
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:space];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}
- (void)setTextLineSpace
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    CGFloat space = [self.text sizeWithFont:self.font].height*0.2;
    [paragraphStyle setLineSpacing:4];//UI 要求8像素间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
    self.lineBreakMode = NSLineBreakByTruncatingTail;
    [self sizeToFit];
}
- (void)setTextFont:(UIFont *)font color:(UIColor *)color atRange:(NSRange)range
{
    [self setTextAttributes:@{NSFontAttributeName : font,
                              NSForegroundColorAttributeName : color}
                    atRange:range];
}

- (void)setTextAttributes:(NSDictionary *)attributes atRange:(NSRange)range
{
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [mutableAttributedString setAttributes:attributes range:range];
    self.attributedText = mutableAttributedString;
}

- (void)setLabelAppointStrColorWithStr:(NSString *)str color:(UIColor *)color{
    if (str == nil) {
        str = @"";
    }
    NSRange range = [self.text rangeOfString:str];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributedStr addAttribute:NSForegroundColorAttributeName
                          value:color
                          range:range];
    self.attributedText = attributedStr;
}
+ (instancetype)makeLabel:(void (^)(UILabel *))textLabel{
    UILabel *label = [[UILabel alloc]init];
    textLabel(label);
    return label;
}
- (UILabel * (^)(NSString *))addText{
    return ^(NSString *text) {
        [self setText: text];
        return self;
    };
}
- (UILabel *(^)(CGFloat))addTextFont{
    return ^(CGFloat font){
        [self setFont:[UIFont systemFontOfSize:font]];
        return self;
    };
}
- (UILabel *(^)(UIColor *))addTextColor{
    return ^(UIColor *textColor){
        [self setTextColor:textColor];
        return self;
    };
}
- (UILabel *(^)(UIColor *))addLabelBackgroudColor{
    return ^(UIColor *backgroudColor){
        [self setBackgroundColor:backgroudColor];
        return self;
    };
}
- (UILabel *(^)(CGRect))addLabelFrame{
    return ^(CGRect labelFrame){
        [self setFrame:labelFrame];
        return self;
    };

}
+(void)ShowalertViewInCenterWithTitle:(NSString *)title andShowView:(UIView *)view{
    
    UILabel * label = [view viewWithTag:10086];
    [label removeFromSuperview];
    
    CGSize titleSize = [title sizeWithFont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(MAXFLOAT, 30)];
    
    UILabel * alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-(titleSize.width+30)/2, SCREEN_HEIGHT/2-30, titleSize.width+30, 30)];
    alertLabel.text = title;
    alertLabel.tag = 10086;
    alertLabel.textColor = [UIColor whiteColor];
    alertLabel.font = [UIFont systemFontOfSize:15];
    alertLabel.backgroundColor = [UIColor darkGrayColor];
    alertLabel.alpha = 0.7;
    alertLabel.layer.cornerRadius = 5;
    alertLabel.layer.masksToBounds = YES;
    alertLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:alertLabel];
    
    [UIView animateWithDuration:2 animations:^{
        alertLabel.alpha = 0;
    } completion:^(BOOL finished) {
        [alertLabel removeFromSuperview];
        
    }];
    
}

@end
