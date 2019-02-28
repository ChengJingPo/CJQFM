//
//  CJQTabBar.h
//  CJQFM
//
//  Created by cjq on 2019/2/28.
//  Copyright © 2019 cjq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJQTabBar : UITabBar

/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);

@end

NS_ASSUME_NONNULL_END
