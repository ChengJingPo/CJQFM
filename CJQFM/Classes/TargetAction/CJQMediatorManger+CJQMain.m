//
//  CJQMediatorManger+CJQMain.m
//  CJQFM
//
//  Created by cjq on 2018/11/12.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "CJQMediatorManger+CJQMain.h"

@implementation CJQMediatorManger (CJQMain)

+ (UIViewController *)rootTabBarController {
    
   UIViewController *vc =  [self performTarget:@"CJQMainModuleAPI"
                                        action:@"rootTabBarController"
                                        params:nil
                                        isRequiredReturnValue:YES];
//    
//    if (vc == nil) {
//        return nil;
//    }
    return vc;
}
    

+ (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName: (NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    NSArray *params = @[vc ,normalImageName,selectedImageName,@(isRequired)];
    [self performTarget:@"CJQMainModuleAPI"
                 action:@"addChildVC:"
                 params:params
                 isRequiredReturnValue:NO];
}

+ (void)setTabBarMiddleBtnBlock: (void(^)(BOOL isPlaying))middleClickBlock {
    
    [self performTarget:@"CJQMainModuleAPI"
                 action:@"setTabBarMiddleBtnClick:"
                 params:middleClickBlock
                 isRequiredReturnValue:NO];
}

@end
