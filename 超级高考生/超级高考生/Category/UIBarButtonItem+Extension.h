//
//  UIBarButtonItem+Extension.h
//  ZYZY
//
//  Created by apple on 17-7-17.
//  Copyright (c) 2017年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
