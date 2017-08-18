//
//  ZYProFressionalServer.h
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/17.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "BaseService.h"

@interface ZYProFressionalServer : BaseService
+(void)getAreasWithPageCount:(NSString *)count WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt;

@end
