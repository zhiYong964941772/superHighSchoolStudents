//
//  ZYLoginServer.h
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/17.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "BaseService.h"

@interface ZYLoginServer : BaseService
+(void)getPhoneCodeWithPhone:(NSString *)phone WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt;
+(void)signWithUserData:(NSDictionary *)dic WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt;
+(void)loginWithUserData:(NSDictionary *)dic WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt;
+(void)validationWithPhoneCode:(NSDictionary *)dic WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt;
+(void)changePasswordWithPassword:(NSDictionary *)dic WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt;
+(void)check_loginWithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt;
+(void)getUserIDWithDic:(NSDictionary *)dic Success:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt;


@end
