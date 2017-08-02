//
//  BaseService.h
//  BeautifulBreastClub
//
//  Created by 赖志勇 on 2017/4/19.
//  Copyright © 2017年 POling. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ServiceSuccessHandle)(id obj);                                                        // 成功处理
typedef void(^ServiceFailureHandle)(id obj);                                                        // 失败处理
typedef void(^NetworkServiceFailureHandle)(NSError *error);      // 失败处理(网络)

@interface BaseService : NSObject

@end
