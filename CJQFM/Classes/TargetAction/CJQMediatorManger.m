//
//  CJQMediatorManger.m
//  CJQFM
//
//  Created by cjq on 2018/11/12.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "CJQMediatorManger.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation CJQMediatorManger

+ (id)performTarget: (NSString *)targetName action: (NSString *)actionName params: (id)params isRequiredReturnValue: (BOOL)isRequiredReturnValue {


    // 1.获取目标
    Class targetCls = NSClassFromString(targetName);
    if (targetCls == nil) {
        NSLog(@"目标不存在");
        return nil;
    }

    //2.获取action
    SEL action = NSSelectorFromString(actionName);
    if (action == nil) {
        NSLog(@"action不存在");
        return nil;
    }

    if (![targetCls respondsToSelector:action]) {

        NSLog(@"目标找不到对应的方法");
        return nil;
    }

    if (isRequiredReturnValue) {
        SuppressPerformSelectorLeakWarning(return [targetCls performSelector:action withObject:params]);
    }else {
        SuppressPerformSelectorLeakWarning([targetCls performSelector:action withObject:params]);
    }
    return  nil;
}



@end
