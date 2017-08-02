//
//  NSString+Extension.h
//  BeautifulBreastClub
//
//  Created by 潘东 on 2017/6/12.
//  Copyright © 2017年 BeautifulBreastClub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeSpacingWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;
+ (NSString*) stringWithUUID;
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
