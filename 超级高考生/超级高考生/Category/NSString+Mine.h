//
//  NSString+Mine.h
//  Vatter
//
//  Created by innofive on 16/5/6.
//  Copyright © 2016年 innofive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Mine)
//日期转换

+(NSString *)magenageAbsoluteTime:(NSString *)timeStamp isDate:(BOOL)isDate ;
- (NSString *)IDcard_no:(NSString *)card_no;
+(NSString *)IDcard_no:(NSString *)card_no frontNo:(NSInteger)f lastNo:(NSInteger)l;
-(NSString*)htmlImageAdaptWith:(long)width;
-(NSString*)htmlImageAdaptWith:(long)width withHeight:(long)height;

@end
