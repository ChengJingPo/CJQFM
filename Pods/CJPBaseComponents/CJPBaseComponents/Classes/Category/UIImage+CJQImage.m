//
//  UIImage+CJQImage.m
//  CJQFM
//
//  Created by cjq on 2019/2/27.
//  Copyright © 2019 cjq. All rights reserved.
//

#import "UIImage+CJQImage.h"

@implementation UIImage (CJQImage)

+ (UIImage *)originImageWithName: (NSString *)name {
    return [[UIImage imageNamed:name]
            imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (UIImage *)circleImage {
    
    CGSize size = self.size;
    CGFloat drawWH = size.width < size.height ? size.width : size.height;
    
    UIGraphicsBeginImageContext(CGSizeMake(drawWH, drawWH));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect clipRect = CGRectMake(0, 0, drawWH, drawWH);
    CGContextAddEllipseInRect(context, clipRect);
    CGContextClip(context);
    
    CGRect drawRect = CGRectMake(0, 0, size.width, size.height);
    [self drawInRect:drawRect];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImage;
}

@end
