//
//  NSString+Check.h
//  BeautifulBreastClub
//
//  Created by 潘东 on 2017/5/22.
//  Copyright © 2017年 BeautifulBreastClub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)
/**
 是否为手机号
 */
+ (BOOL)isPhoneNumber:(NSString *)str;
/**
 是否为邮箱
 */
+ (BOOL)isEmail:(NSString *)str;
/**
 是否为身份证号
 */
+ (BOOL) isValidateIdentityCard: (NSString *)identityCard;

/**
 正则匹配用户密码6-20位数字、字母和下划线三选二组合
 */
+ (BOOL)isPassword:(NSString *) str;

/**
 银行卡正则
 */
+ (BOOL) IsBankCard:(NSString *)cardNumber;
@end
