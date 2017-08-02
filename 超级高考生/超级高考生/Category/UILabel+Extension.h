//
//  UILabel+Extension.h
//  BeautifulBreastClub
//
//  Created by 潘东 on 2017/6/3.
//  Copyright © 2017年 BeautifulBreastClub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 指定范围字体大小设置
 */
- (void)setTextFont:(UIFont *)font atRange:(NSRange)range;

/**
 指定范围更改颜色
 */
- (void)setTextColor:(UIColor *)color atRange:(NSRange)range;

/**
 指定范围更改间距
 */
- (void)setTextLineSpace:(float)space atRange:(NSRange)range;

/**
 指定范围更改字体大小与颜色
 */
- (void)setTextFont:(UIFont *)font color:(UIColor *)color atRange:(NSRange)range;

/**
 传入一个字典更改Attributes属性
 */
- (void)setTextAttributes:(NSDictionary *)attributes atRange:(NSRange)range;

/**
 默认间距
 */
- (void)setTextLineSpace;

/**
 更改指定字符串颜色

 @param str 需要更改的字符
 @param color 颜色
 */
- (void)setLabelAppointStrColorWithStr:(NSString *)str color:(UIColor *)color;

+ (instancetype)makeLabel:(void(^)(UILabel *label))textLabel;
- (UILabel * (^)(NSString *text))addText;
- (UILabel * (^)(UIColor *textColor))addTextColor;
- (UILabel * (^)(CGFloat font))addTextFont;
- (UILabel * (^)(UIColor *backgroudColor))addLabelBackgroudColor;
- (UILabel * (^)(CGRect labelFrame))addLabelFrame;


@end
