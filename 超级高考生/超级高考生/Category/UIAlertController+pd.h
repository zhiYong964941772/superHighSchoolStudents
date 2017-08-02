//
//  UIAlertController+pd.h
//  BeautifulBreastClub
//
//  Created by 潘东 on 2017/6/5.
//  Copyright © 2017年 BeautifulBreastClub. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^actionHandler)(UIAlertAction *action, NSUInteger index);
@interface UIAlertController (pd)
/**
 *  按钮--底部
 *
 *  @param title            提示标题
 *  @param message          提示信息
 *  @param actionTitle      按钮标题，数组
 *  @param actionHandler    按钮响应事件
 */
+ (void)actionSheettWithTitle:(NSString *)title
                      message:(NSString *)message
                 actionTitles:(NSArray *)actionTitle
             alertActionStyle:(UIAlertActionStyle)style
                actionHandler:(actionHandler)actionHandler;
@end
