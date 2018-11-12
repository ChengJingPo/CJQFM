//
//  CJQMainModuleAPI.m
//  CJQFM
//
//  Created by cjq on 2018/11/12.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "CJQMainModuleAPI.h"
#import "CJQTabBarController.h"
#import "CJQTabBar.h"
#import "CJQNavBar.h"
#import "CJQMiddleView.h"

@implementation CJQMainModuleAPI

+ (UITabBarController *)rootTabBarController {
    
    return [CJQTabBarController shareInstance];
}

+ (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName: (NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    [[CJQTabBarController shareInstance] addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired ];
}

+ (void)addChildVC: (NSArray *)para {
    
    UIViewController *vc = para[0];
    NSString *normalImageName = para[1];
    NSString *selectedImaegName = para[2];
    BOOL   isRequired = para[3];
    [self addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImaegName isRequiredNavController:isRequired];
}


+ (void)setTabBarMiddleBtnClick: (void(^)(BOOL isPlaying))middleClickBlock {
    CJQTabBar *tarbar = (CJQTabBar *) [CJQTabBarController shareInstance].tabBar;
    tarbar.middleClickBlock  = middleClickBlock;
}
+ (void)setNavBarGlobalBackGroundImage: (UIImage *)globalImg {
    
    [CJQNavBar setGlobalBackGroundImage:globalImg];
}

+ (void)setNavBarGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize {
    
    [CJQNavBar setGlobalTextColor:globalTextColor andFontSize:fontSize ];
}

+ (UIView *)middleView {
   return  [CJQMiddleView middleView];
}

@end
