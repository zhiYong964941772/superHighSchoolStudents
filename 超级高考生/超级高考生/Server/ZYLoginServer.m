//
//  ZYLoginServer.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/17.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYLoginServer.h"

@implementation ZYLoginServer
+(void)getPhoneCodeWithPhone:(NSString *)phone WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt{
    NSDictionary *dic = @{@"phone":phone};
    [HttpTool getWithUrl:@"code" refreshCache:NO params:dic success:^(id response) {
        
    } fail:^(NSError *error) {
        
    }];
    
}
+ (void)signWithUserData:(NSDictionary *)dic WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt{
  
    [HttpTool postWithUrl:@"user/register" refreshCache:NO params:dic success:^(id response) {
        NSDictionary *dic = response;
        if ([dic[@"success"]integerValue]==1) {
            success(@"注册成功");
        }else{
            success(dic[@"message"]);
 
        }
    } fail:^(NSError *error) {
        
    }];
}
+ (void)loginWithUserData:(NSDictionary *)dic WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt{
    [HttpTool postWithUrl:@"user/login" refreshCache:NO params:dic success:^(id response) {
        NSDictionary *dic = response;
        if ([dic[@"success"]integerValue]==1) {
            TOKEN = dic[@"result"][@"token"];
            success(@"登陆成功");
        }else{
            success(@"账号或密码有误");
        }
    } fail:^(NSError *error) {
        
    }];
}
+ (void)validationWithPhoneCode:(NSDictionary *)dic WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt{
    [HttpTool postWithUrl:@"user/code/check" refreshCache:NO params:dic success:^(id response) {
        NSDictionary *dic = response;
        success(dic[@"result"]);
           } fail:^(NSError *error) {
        
    }];
}
+ (void)changePasswordWithPassword:(NSDictionary *)dic WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt{
    [HttpTool postWithUrl:@"user/reset_password" refreshCache:NO params:dic success:^(id response) {
        NSDictionary *dic = response;
        success(dic[@"result"]);
    } fail:^(NSError *error) {
        
    }];
}
+ (void)check_loginWithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt{
  [HttpTool getWithUrl:@"user/check_login" refreshCache:NO success:^(id response) {
      NSDictionary *dic = response;
      USERID = [NSString stringWithFormat:@"%@",dic[@"id"]];
      USERNAME = dic[@"name"];
      if (!USERNAME) {
          USERNAME = @"";
          USERID = @"";
      }
      success(dic[@"success"]);
  } fail:^(NSError *error) {
      
  }];
}
+ (void)getUserIDWithDic:(NSDictionary *)dic Success:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt{
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc]initWithDictionary:dic];
    NSString *str = dic[@"name"];
    if (str.length<1) {
        [self check_loginWithSuccess:^(id obj) {
            [mutableDic setObject:USERNAME forKey:@"name"];
            [HttpTool getWithUrl:@"user" refreshCache:NO params:mutableDic success:^(id response) {
                NSDictionary *dic = response;
                USERID = [NSString stringWithFormat:@"%@",dic[@"id"]];
                USERNAME = dic[@"name"];
                success(dic[@"success"]);
            } fail:^(NSError *error) {
                
            }];
 
        } WithFailt:^(id obj) {
            
        }];
    }
   }
@end
