//
//  UIView+CJQLayout.m
//  CJQFM
//
//  Created by cjq on 2018/10/10.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "UIView+CJQLayout.h"

@implementation UIView (CJQLayout)

- (void)setCenterX:(CGFloat)centerX {
    
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
}

- (CGFloat)centerX {
    return  self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setX:(CGFloat)x {
    
    CGRect temp = self.frame;
    temp.origin.x = x;
    self.frame = temp;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    
    CGRect temp = self.frame;
    temp.origin.y = y;
    self.frame = temp;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    
    CGRect temp = self.frame;
    temp.size.width = width;
    self.frame = temp;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame  = temp;
}

- (CGFloat)height {
    return self.frame.size.height;
}
@end
