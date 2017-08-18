//
//  ZYSupperHighStudentHeader.h
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/29.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#ifndef ZYSupperHighStudentHeader_h
#define ZYSupperHighStudentHeader_h

#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define DEVICE(version)  ([[[UIDevice currentDevice] systemVersion] floatValue] >=version)
#define BASECOLORLA(r,g,b,A) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:A]
#define BASECOLORL(r,g,b) BASECOLORLA(r,g,b,1.0)
#define NSNOTIFICATION [NSNotificationCenter defaultCenter]
#define NSUSERDEFAULTS [NSUserDefaults standardUserDefaults]
#define HomeDirectory [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define WS(weakSelf)  __weak typeof(self)weakSelf = self;
#define ZHI_NSNotificationCenter [NSNotificationCenter defaultCenter]
#define SERVERAPI @"http://118.89.63.156:3000/api"
#endif /* ZYSupperHighStudentHeader_h */
