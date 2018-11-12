//
//  CJQMediatorManger+CJQMain.h
//  CJQFM
//
//  Created by cjq on 2018/11/12.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "CJQMediatorManger.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJQMediatorManger (CJQMain)

+ (UIViewController *)rootTabBarController;

+ (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName: (NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;

+ (void)setTabBarMiddleBtnBlock: (void(^)(BOOL isPlaying))middleClickBlock;

@end

NS_ASSUME_NONNULL_END
