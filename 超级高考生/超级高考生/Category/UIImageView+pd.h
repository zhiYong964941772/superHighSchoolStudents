//
//  UIImageView+pd.h
//  BeautifulBreastClub
//
//  Created by 潘东 on 2017/5/11.
//  Copyright © 2017年 BeautifulBreastClub. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIImageView * _Nullable (^addViewImage)(NSString * _Nullable imageStr);
typedef UIImageView * _Nullable (^addViewFrame)(CGRect imageFrame);
typedef UIImageView * _Nullable (^addViewContentMode)(UIViewContentMode contentMode);
typedef UIImageView * _Nullable (^addViewColor)(UIColor * _Nullable backgroudColor);

@interface UIImageView (pd)
/**
 * 不需要占位图的
 */
- (void)pd_setImageNoPlaceholderImage:(nullable NSString *)url;
/**
 * 默认有占位图的
 */
- (void)pd_setImage:(nullable NSString *)url;
/**
 * 需要一个占位图片
 */
- (void)pd_setImage:(nullable NSString *)url
          placeholderImageName:(nullable NSString *)placeholder;
+ (instancetype _Nullable )makeImage:(void (^_Nullable)(UIImageView *_Nullable imageView))imageViewBlock;
- (addViewImage _Nullable )addImage;
- (addViewFrame _Nullable )addFrame;
- (addViewColor _Nullable )addColor;
- (addViewContentMode _Nullable )addContentMode;
@end
