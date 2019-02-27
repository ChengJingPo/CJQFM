//
//  UIView+CJQNib.h
//  CJQFM
//
//  Created by cjq on 2018/10/10.
//  Copyright © 2018 cjq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CJQNib)

/**
 *  返回当前视图所在的VC
 *
 *  @return 控制器
 */
- (UIViewController *)currentViewController;

@end

NS_ASSUME_NONNULL_END
