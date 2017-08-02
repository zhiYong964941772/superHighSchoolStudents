//
//  UIAlertController+pd.m
//  BeautifulBreastClub
//
//  Created by 潘东 on 2017/6/5.
//  Copyright © 2017年 BeautifulBreastClub. All rights reserved.
//

#import "UIAlertController+pd.h"

@implementation UIAlertController (pd)
+ (void)actionSheettWithTitle:(NSString *)title
                      message:(NSString *)message
                 actionTitles:(NSArray *)actionTitle
             alertActionStyle:(UIAlertActionStyle)style
                actionHandler:(actionHandler)actionHandler {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSUInteger i = 0; i < actionTitle.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)  {
            actionHandler(action, i+1);
        }];
        [alertC addAction:action];
    }
    if (style == UIAlertActionStyleCancel) {
        [alertC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    }
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertC animated:YES completion:nil];
}
@end
