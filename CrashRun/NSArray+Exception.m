//
//  NSArray+Exception.m
//  LongFor
//
//  Created by Lee on 2017/7/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "NSArray+Exception.h"
#import <objc/runtime.h>

@implementation NSArray (Exception)

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        @autoreleasepool {
//            [objc_getClass("__NSArray0") lee_exchangeOriginSel:@selector(objectAtIndex:) exchangeSel:@selector(lee_emptyArrObjectAtIndex:)];
//            [objc_getClass("__NSArrayI") lee_exchangeOriginSel:@selector(objectAtIndex:) exchangeSel:@selector(lee_objectAtIndex:)];
//            [objc_getClass("__NSArrayM") lee_exchangeOriginSel:@selector(objectAtIndex:) exchangeSel:@selector(lee_mutableObjectAtIndex:)];
//            [objc_getClass("__NSArrayM") lee_exchangeOriginSel:@selector(addObject:) exchangeSel:@selector(lee_mutableAddObject:)];
//            [objc_getClass("__NSArrayM") lee_exchangeOriginSel:@selector(insertObject:atIndex:) exchangeSel:@selector(lee_mutableInsertObject:atIndex:)];
//        }
//    });
//}
//
//- (id)lee_emptyArrObjectAtIndex:(NSInteger)index {
//    return nil;
//}
//
//- (id)lee_objectAtIndex:(NSInteger)index {
//    @autoreleasepool {
//        if (index >= self.count || index < 0) {
//            return nil;
//        }
//        return [self lee_objectAtIndex:index];
//    }
//}
//
//- (id)lee_mutableObjectAtIndex:(NSInteger)index {
//    @autoreleasepool {
//        if (index >= self.count || index < 0) {
//            return nil;
//        }
//        return [self lee_mutableObjectAtIndex:index];
//    }
//}
//
//- (void)lee_mutableAddObject:(id)object {
//    if (object) {
//        [self lee_mutableAddObject:object];
//    }
//}
//
//- (void)lee_mutableInsertObject:(id)object atIndex:(NSUInteger)index {
//    if (object) {
//        [self lee_mutableInsertObject:object atIndex:index];
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
