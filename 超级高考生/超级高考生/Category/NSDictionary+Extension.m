//
//  NSDictionary+Extension.m
//  BeautifulBreastClub
//
//  Created by 潘东 on 2017/5/10.
//  Copyright © 2017年 BeautifulBreastClub. All rights reserved.
//

#import "NSDictionary+Extension.h"
#import <objc/runtime.h>
@implementation NSDictionary (Extension)
+ (void)avoidCrashExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method1 = class_getClassMethod(self, @selector(dictionaryWithObjects:forKeys:count:));
        Method method2 = class_getClassMethod(self, @selector(avoidCrashDictionaryWithObjects:forKeys:count:));
        method_exchangeImplementations(method1, method2);
    });
}
+ (instancetype)avoidCrashDictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self avoidCrashDictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self avoidCrashDictionaryWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}
@end
