//
//  UIImageView+pd.m
//  BeautifulBreastClub
//
//  Created by 潘东 on 2017/5/11.
//  Copyright © 2017年 BeautifulBreastClub. All rights reserved.
//

#import "UIImageView+pd.h"

#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"
#import "UIView+WebCache.h"
@implementation UIImageView (pd)

- (void)pd_setImageNoPlaceholderImage:(nullable NSString *)url{
    [self pd_setImageWithURL:[self pd_makeURLWithUrl:url] placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)pd_setImage:(nullable NSString *)url{
    [self pd_setImageWithURL:[self pd_makeURLWithUrl:url] placeholderImage:[UIImage imageNamed:@"placeholder"] options:0 progress:nil completed:nil];
}
- (void)pd_setImage:(nullable NSString *)url
          placeholderImageName:(nullable NSString *)placeholder{
    [self pd_setImageWithURL:[self pd_makeURLWithUrl:url] placeholderImage:[UIImage imageNamed:placeholder] options:0 progress:nil completed:nil];
}

- (NSURL *)pd_makeURLWithUrl:(NSString *)url{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"",url]];
}

- (void)pd_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder
                   options:(SDWebImageOptions)options
                  progress:(nullable SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self sd_internalSetImageWithURL:url
                    placeholderImage:placeholder
                             options:options
                        operationKey:nil
                       setImageBlock:nil
                            progress:progressBlock
                           completed:completedBlock];
}
+ (instancetype)makeImage:(void (^)(UIImageView *))imageViewBlock{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageViewBlock(imageView);
    return imageView;
}

- (addViewImage)addImage{
    return ^(NSString *imageName){
        [self setImage:[UIImage imageNamed:imageName]];
        return self;
    };
}
- (addViewFrame)addFrame{
    return ^(CGRect frame){
        [self setFrame:frame];
        return self;
    };
}
- (addViewColor)addColor{
    return ^(UIColor *color){
        [self setBackgroundColor:color];
        return self;
    };
}
- (addViewContentMode)addContentMode{
    return ^(UIViewContentMode mode){
        [self setContentMode:mode];
        return self;
    };
}
@end
