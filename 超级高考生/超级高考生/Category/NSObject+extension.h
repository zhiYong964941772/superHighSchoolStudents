//
//  NSObject+extension.h
//  testModel
//
//  Created by 赖志勇 on 2017/7/11.
//  Copyright © 2017年 zhiYong_lai. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol modelDelegate <NSObject>
@optional
+(NSDictionary *)arrayContainModelClass;
@end
@interface NSObject (extension)
+ (void)resolveDict:(NSDictionary *)dict;
+ (void)resolveArrt:(NSArray *)arrt;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
