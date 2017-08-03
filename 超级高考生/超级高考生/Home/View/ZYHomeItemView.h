//
//  ZYHomeItemView.h
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYHomeItemView : UIView
+ (instancetype)showItemViewWitBtnAction:(void(^)(ZYHomeItemView*view))btnBlock;
@property (nonatomic ,copy)void(^growthBlock)();
@property (nonatomic ,copy)void(^notesBlock)();
@property (nonatomic ,copy)void(^activity)();
@property (nonatomic ,copy)void(^bookStoresBlock)();

@end
