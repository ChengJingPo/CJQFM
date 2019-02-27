//
//  UIView+CJQNib.m
//  CJQFM
//
//  Created by cjq on 2018/10/10.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "UIView+CJQNib.h"

@implementation UIView (CJQNib)

- (UIViewController *)currentViewController {
    
    for (UIView *next = [self superview]; next; next = next.superview) {
        
        UIResponder *nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
