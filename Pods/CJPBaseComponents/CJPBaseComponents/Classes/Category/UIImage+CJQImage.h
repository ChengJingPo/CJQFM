//
//  UIImage+CJQImage.h
//  CJQFM
//
//  Created by cjq on 2019/2/27.
//  Copyright © 2019 cjq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CJQImage)

+ (UIImage *)originImageWithName: (NSString *)name;

- (UIImage *)circleImage;

@end

NS_ASSUME_NONNULL_END
