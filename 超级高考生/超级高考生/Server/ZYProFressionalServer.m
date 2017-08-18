//
//  ZYProFressionalServer.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/17.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYProFressionalServer.h"

@implementation ZYProFressionalServer
+(void)getAreasWithPageCount:(NSString *)count WithSuccess:(ServiceSuccessHandle)success WithFailt:(ServiceFailureHandle)failt{
    NSDictionary *dic = @{@"page_count":count};
    [HttpTool getWithUrl:@"areas" refreshCache:NO params:dic success:^(id response) {
        
    } fail:^(NSError *error) {
        
    }];

}
@end
