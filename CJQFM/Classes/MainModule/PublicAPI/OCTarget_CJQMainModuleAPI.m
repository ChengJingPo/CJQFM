//
//  CJQMainModuleAPI.m
//  CJQFM
//
//  Created by cjq on 2018/11/12.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "OCTarget_CJQMainModuleAPI.h"
#import "CJQTabBarController.h"
#import "CJQTabBar.h"
#import "CJQNavBar.h"
#import "CJQMiddleView.h"

@implementation OCTarget_CJQMainModuleAPI

//+ (UITabBarController *)action_rootTabBarController {
//
//    return [CJQTabBarController shareInstance];
//}
- (UITabBarController *)action_rootTabBarController:(id )para {
    UITabBarController *tarBarVC = [CJQTabBarController shareInstance];
    return tarBarVC;
}

- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName: (NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    [[CJQTabBarController shareInstance] addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired ];
}

//+ (void)action_addChildVC: (NSArray *)para {
//
//    UIViewController *vc = para[0];
//    NSString *normalImageName = para[1];
//    NSString *selectedImaegName = para[2];
//    BOOL   isRequired = para[3];
//    [self addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImaegName isRequiredNavController:isRequired];
//}
- (void)action_addChildVC:(NSDictionary *)requitedParam {
    //NSArray *param =  [NSArray arrayWithArray:requitedParam[@"arrayParam"] ];
    NSArray *param = requitedParam[@"arrayParams"];
    UIViewController *vc = param[0];
    NSString *normalImageName = param[1];
    NSString *selectedImaegName = param[2];
    BOOL isRequired = [param[3] boolValue];
    [self addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImaegName isRequiredNavController:isRequired];
    
}

+ (void)action_setTabBarMiddleBtnClick: (void(^)(BOOL isPlaying))middleClickBlock {
    CJQTabBar *tarbar = (CJQTabBar *) [CJQTabBarController shareInstance].tabBar;
    tarbar.middleClickBlock  = middleClickBlock;
}
+ (void)action_setNavBarGlobalBackGroundImage: (UIImage *)globalImg {
    
    [CJQNavBar setGlobalBackGroundImage:globalImg];
}

+ (void)action_setNavBarGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize {
    
    [CJQNavBar setGlobalTextColor:globalTextColor andFontSize:fontSize ];
}

+ (UIView *)action_middleView {
   return  [CJQMiddleView middleView];
}

- (void)notFound:(id)params{
    NSLog(@"not fount ");
}
@end
