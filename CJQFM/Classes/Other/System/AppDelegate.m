//
//  AppDelegate.m
//  CJQFM
//
//  Created by cjq on 2018/10/27.
//  Copyright © 2018年 cjq. All rights reserved.
//

#import "AppDelegate.h"
//#import "CJQTabBarController.h"
#import "CJQTestOneVC.h"
//#import "CJQTabBar.h"
//#import "CJQMainModuleAPI.h"
#import "CJQMediatorManger+CJQMain.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //0:原始
   
//    CJQTabBarController *rootVC = [CJQTabBarController tabBarControllerWithAddChildVCsBlock:^(CJQTabBarController * _Nonnull tabBarVC) {
//
//        CJQTestOneVC *testVC = [[CJQTestOneVC alloc] init];
//
//        [tabBarVC addChildVC:testVC  normalImageName:@"tabbar_find_n"
//                                                selectedImageName:@"tabbar_find_h"
//                                                isRequiredNavController:YES];
//        [tabBarVC addChildVC:[UIViewController new] normalImageName:@"tabbar_sound_n"
//                                                    selectedImageName:@"tabbar_sound_h"
//                                                    isRequiredNavController:YES];
//        [tabBarVC addChildVC:[UIViewController new ] normalImageName:@"tabbar_download_n"
//                                                     selectedImageName:@"tabbar_download_h"
//                                                     isRequiredNavController:YES];
//        [tabBarVC addChildVC:[UIViewController new] normalImageName:@"tabbar_me_n"
//                                                    selectedImageName:@"tabbar_me_h"
//                                                    isRequiredNavController:YES];
//   }];
////
//    CJQTabBar *tabBar = (CJQTabBar *)rootVC.tabBar;
//    tabBar.middleClickBlock = ^(BOOL isPlaying){
//
//        if (isPlaying) {
//            NSLog(@"palying");
//        }else {
//            NSLog(@"stop");
//        }
//   };
//    //self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = rootVC;
    
    //1.增加公共API，以降低耦合度
//    [CJQMainModuleAPI addChildVC:[CJQTestOneVC new]
//                      normalImageName:@"tabbar_find_n"
//                      selectedImageName:@"tabbar_find_h"
//                      isRequiredNavController: YES ];
//    [CJQMainModuleAPI addChildVC:[UIViewController new]
//                      normalImageName: @"tabbar_sound_n"
//                      selectedImageName:@"tabbar_sound_h"
//                      isRequiredNavController: YES ];
//    [CJQMainModuleAPI addChildVC:[UIViewController new]
//                      normalImageName:@"tabbar_download_n"
//                      selectedImageName:@"tabbar_download_h"
//                      isRequiredNavController:  YES];
//    [CJQMainModuleAPI addChildVC:[UIViewController new]
//                      normalImageName:@"tabbar_me_n"
//                      selectedImageName:@"tabbar_me_h"
//                      isRequiredNavController: YES ];
//
//    [CJQMainModuleAPI setTabBarMiddleBtnClick:^(BOOL isPlaying) {
//
//                if (isPlaying) {
//                    NSLog(@"palying");
//                }else {
//                    NSLog(@"stop");
//                }
//    }];
//
//    self.window.rootViewController = [CJQMainModuleAPI rootTabBarController];
    
    // 3 .体验路由方案（target-action)
    
    //4. 在3的体验基础上，通过URL进行操作，同时增加了返回类型是非对象类型的方法（action)的处理方法--通过消息转发（NSInvoction)处理
    
    [CJQMediatorManger addChildVC:[CJQTestOneVC new]
                       normalImageName:@"tabbar_find_n"
                       selectedImageName:@"tabbar_find_h"
                       isRequiredNavController:YES];
    [CJQMediatorManger addChildVC:[UIViewController new]
                  normalImageName:@"tabbar_sound_n"
                selectedImageName:@"tabbar_sound_h"
          isRequiredNavController:YES];
    [CJQMediatorManger addChildVC:[UIViewController new]
                  normalImageName:@"tabbar_download_n"
                selectedImageName:@"tabbar_download_h"
          isRequiredNavController:YES];
    [CJQMediatorManger addChildVC:[UIViewController new]
                  normalImageName:@"tabbar_me_n"
                selectedImageName:@"tabbar_me_h"
          isRequiredNavController:YES];
    
    self.window.rootViewController = [CJQMediatorManger  rootTabBarController];
    [self.window  makeKeyAndVisible];
    return YES;
    
}





@end
