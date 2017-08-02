//
//  NSString+Mine.m
//  Vatter
//
//  Created by innofive on 16/5/6.
//  Copyright © 2016年 innofive. All rights reserved.
//

#import "NSString+Mine.h"

@implementation NSString (Mine)
//  日期转换
+(NSString *)magenageAbsoluteTime:(NSString *)timeStamp isDate:(BOOL)isDate{
    
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]/1000];
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    if (isDate)
        [format setDateFormat:@"yyyy.MM.dd"];
    else
        [format setDateFormat:@"yyyy.MM.dd HH:mm"];
    
    NSString *dateString = [format stringFromDate:confromTimesp];
    
    return dateString;
    
}
//显示前四位 后四位
- (NSString *)IDcard_no:(NSString *)card_no
{
    if (card_no.length<=8) {
        return card_no;
    }
    NSString *fisrt = [card_no substringToIndex:4];
    NSString *end = [card_no substringFromIndex:card_no.length-4];
    NSMutableString *tmp = [NSMutableString string];
    for (int i = 0; i<card_no.length-8; i++) {
        [tmp appendString:@"*"];
    }
    return [NSString stringWithFormat:@"%@%@%@",fisrt,tmp,end];
}
//截取前f个  后l个 其他 ＊＊＊＊显示 用于证件 比如身份证 或 银行卡
+(NSString *)IDcard_no:(NSString *)card_no frontNo:(NSInteger)f lastNo:(NSInteger)l
{
    if (card_no.length<=f+l) {
        return card_no;
    }
    NSString *fisrt = [card_no substringToIndex:f];
    NSString *end = [card_no substringFromIndex:card_no.length-l];
    NSMutableString *tmp = [NSMutableString string];
    for (int i = 0; i<card_no.length-f+l; i++) {
        [tmp appendString:@"*"];
    }
    return [NSString stringWithFormat:@"%@%@%@",fisrt,tmp,end];
}
-(NSString*)htmlImageAdaptWith:(long)width
{
    
    NSString *newString = [NSString stringWithFormat:@".jpeg\" width=\"%ldpx\"",width];
    
    
    
    
    
    return [self stringByReplacingOccurrencesOfString:@".jpeg\"" withString:newString];
}
-(NSString*)htmlImageAdaptWith:(long)width withHeight:(long)height
{
   // .jpg\" width=\"550\" height=\"342\"
    
    NSString *newString = [NSString stringWithFormat:@".jpg\" width=\"%ldpx\" height=\"%ldpx\"",width,height];
    
    
    
    
    
    return [self stringByReplacingOccurrencesOfString:@".jpg\"" withString:newString];
}
@end
