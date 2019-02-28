//
//  AppDelegate.m
//  CJQFM
//
//  Created by cjq on 2018/10/27.
//  Copyright © 2018年 cjq. All rights reserved.
//

#import "AppDelegate.h"
#import "CJQTabBarController.h"
#import "CJQTestOneVC.h"
#import "CJQTabBar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CJQTabBarController *rootVC = [CJQTabBarController tabBarControllerWithAddChildVCsBlock:^(CJQTabBarController * _Nonnull tabBarVC) {
        
        CJQTestOneVC *testVC = [[CJQTestOneVC alloc] init];
        
        [tabBarVC addChildVC:testVC  normalImageName:@"tabbar_find_n"
                                                selectedImageName:@"tabbar_find_h"
                                                isRequiredNavController:YES];
        [tabBarVC addChildVC:[UIViewController new] normalImageName:@"tabbar_sound_n"
                                                    selectedImageName:@"tabbar_sound_h"
                                                    isRequiredNavController:YES];
        [tabBarVC addChildVC:[UIViewController new ] normalImageName:@"tabbar_download_n"
                                                     selectedImageName:@"tabbar_download_h"
                                                     isRequiredNavController:YES];
        [tabBarVC addChildVC:[UIViewController new] normalImageName:@"tabbar_me_n"
                                                    selectedImageName:@"tabbar_me_h"
                                                    isRequiredNavController:YES];
   }];
//
    CJQTabBar *tabBar = (CJQTabBar *)rootVC.tabBar;
    tabBar.middleClickBlock = ^(BOOL isPlaying){

        if (isPlaying) {
            NSLog(@"palying");
        }else {
            NSLog(@"stop");
        }
   };
    //self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = rootVC;
    [self.window  makeKeyAndVisible];
    return YES;
}





@end
