//
//  CJQMediatorManger.m
//  CJQFM
//
//  Created by cjq on 2018/11/12.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "CJQMediatorManger.h"
#import <UIKit/UIKit.h>
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation CJQMediatorManger

+(instancetype)sharedInstance {
    
    static CJQMediatorManger *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[CJQMediatorManger alloc] init];
    });
    
    return mediator;
}

- (id)openUrl: (NSString *)urlStr WithParams: (NSDictionary *)ExtenParams {
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    NSString *urlString = [url query];
    for (NSString *param in [urlString  componentsSeparatedByString:@"&"]) {
        
        NSArray *elts = [param componentsSeparatedByString:@"="];
        
        if ([elts count] < 2) continue;
        
        id firstEle = [elts firstObject];
        id lastEle = [elts lastObject];
        
        if (firstEle && lastEle) {
            [params setValue:lastEle forKey:firstEle];
        }
        
    }
    
    NSArray *arrayParams = ExtenParams[@"paramFlag"];
    NSDictionary *mutliParams = @{
                                  @"params" : params,
                                  @"arrayParams": arrayParams,
                                  @"middleClickBlock" : ExtenParams[@"middleClickBlock"]
                                  };
    
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"native"]) {
        return @(NO);
    }
    
    BOOL isRqRetuValue = ExtenParams[@"isRequiredReturnValue"];
    
    id result  = [self performTarget:url.host
                              action:actionName
                              params:mutliParams
                              isRequiredReturnValue:isRqRetuValue];
    return result;
}

- (id)performTarget: (NSString *)targetName action: (NSString *)actionName params: (id)params isRequiredReturnValue: (BOOL)isRequiredReturnValue {


//    // 1.获取目标
//    Class targetCls = NSClassFromString(targetName);
//    if (targetCls == nil) {
//        NSLog(@"目标不存在");
//        return nil;
//    }
//
//    //2.获取action
//    SEL action = NSSelectorFromString(actionName);
//    if (action == nil) {
//        NSLog(@"action不存在");
//        return nil;
//    }
//
//    if (![targetCls respondsToSelector:action]) {
//
//        NSLog(@"目标找不到对应的方法");
//        return nil;
//    }
//
//    if (isRequiredReturnValue) {
//        SuppressPerformSelectorLeakWarning(return [targetCls performSelector:action withObject:params]);
//    }else {
//        SuppressPerformSelectorLeakWarning([targetCls performSelector:action withObject:params]);
//    }
    
    NSString *targetClassString = [NSString stringWithFormat:@"OCTarget_%@",targetName];
    NSString *actionMethodString = [NSString stringWithFormat:@"action_%@:",actionName ];
    
    Class targetClass = NSClassFromString(targetClassString);
    NSObject *target = [[targetClass alloc] init];
    
    SEL action = NSSelectorFromString(actionMethodString);
    
    if ([target respondsToSelector:action]) {
        return [self safePerFormTarget:target
                                action:action
                                params:params
                                isRequiredReturnValue:isRequiredReturnValue];
    } else {
        
        SEL action = NSSelectorFromString(@"notFound");
        if ([target respondsToSelector:action]) {
            
            return [self safePerFormTarget:target
                                    action:action
                                    params:params
                                    isRequiredReturnValue:isRequiredReturnValue];
        }else {
            return nil;
        }
    }
    
}

- (id)safePerFormTarget: (NSObject *)target action: (SEL)action params: (id)params isRequiredReturnValue: (BOOL)isRequiredReturnValue {
    
    NSMethodSignature *methodSig = [target methodSignatureForSelector:action];

    if (methodSig == nil) {
        return nil;
    }

    const char *returnType = [methodSig methodReturnType];

    if (strcmp(returnType, @encode(void)) == 0) {

        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setTarget:target];
        [invocation setSelector:action];
        [invocation invoke];

        return nil;
    }

    if (strcmp(returnType, @encode(BOOL)) == 0) {

        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setTarget:target];
        [invocation setSelector:action];
        [invocation invoke];

        NSInteger result = 0;
        [invocation getReturnValue:&result];

        return @(result);
    }

    if (strcmp(returnType, @encode(NSInteger)) == 0) {

        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];

      
        [invocation setArgument:&params atIndex:2];
        [invocation setTarget:target];
        [invocation setSelector:action];
        [invocation invoke];

        NSInteger result = 0;
        [invocation getReturnValue:&result];

        return @(result);
    }

    if (strcmp(returnType, @encode(NSUInteger)) == 0) {

        NSInvocation *invocaton = [NSInvocation invocationWithMethodSignature:methodSig];

        
        [invocaton setArgument:&params atIndex:2];
        [invocaton setTarget:target];
        [invocaton setSelector:action];
        [invocaton invoke];

        NSInteger result = 0;
        [invocaton getReturnValue:&result];

        return @(result);

    }
    if (strcmp(returnType, @encode(CGFloat)) ==0) {

        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
       

        [invocation setArgument:&params atIndex:2];
        [invocation setTarget:target];
        [invocation setSelector:action];
        [invocation invoke];

        NSUInteger restult = 0;
        [invocation getReturnValue:&restult];

        return @(restult);
    }

    if (isRequiredReturnValue) {
        SuppressPerformSelectorLeakWarning(return [target performSelector:action withObject:params]);
    } else {
        SuppressPerformSelectorLeakWarning([target performSelector:action withObject:params]);
    }

    return nil;

}



@end
