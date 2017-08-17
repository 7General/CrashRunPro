//
//  NSDictionary+Exception.m
//  fangfull_new
//
//  Created by Lee on 2017/7/21.
//  Copyright © 2017年 zhonhong. All rights reserved.
//

#import "NSDictionary+Exception.h"
#import <objc/runtime.h>

@implementation NSDictionary (Exception)

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        @autoreleasepool {
//            [objc_getClass("__NSDictionaryM") lee_exchangeOriginSel:@selector(setObject:forKey:) exchangeSel:@selector(lee_mutableSetObject:forKey:)];
//        }
//    });
//}
//
//- (void)lee_mutableSetObject:(id)object forKey:(id)key {
//    if (object && key) {
//        [self lee_mutableSetObject:object forKey:key];
//    }
//}
//
//+ (void)lee_exchangeOriginSel:(SEL)originSel exchangeSel:(SEL)exchangeSel {
//    Class targetClass = [self class];
//    Method originMethod = class_getInstanceMethod(targetClass, originSel);
//    Method exchangeMethod = class_getInstanceMethod(targetClass, exchangeSel);
//    if (class_addMethod(targetClass, originSel, method_getImplementation(exchangeMethod), method_getTypeEncoding(exchangeMethod))) {
//        class_replaceMethod(targetClass, exchangeSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
//    }
//    else {
//        method_exchangeImplementations(originMethod, exchangeMethod);
//    }
//}

@end
