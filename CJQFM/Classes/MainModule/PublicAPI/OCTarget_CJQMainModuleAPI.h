//
//  CJQMainModuleAPI.h
//  CJQFM
//
//  Created by cjq on 2018/11/12.
//  Copyright © 2018 cjq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCTarget_CJQMainModuleAPI : NSObject

/**
 * 获取根控制器
 *
 * @return rootTabBarController
 */
//+ (UITabBarController *)action_rootTabBarController;

- (UITabBarController *)action_rootTabBarController:(id )para;
/**
 *添加子控制器
 *
 *@param vc                子控制器
 *@param normalImageName   普通状态下图片
 *@param selectedImageName 选中图片
 *@param isRequired        是否需要包装导航控制器
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName: (NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;

//+ (void)action_addChildVC: (NSArray *)para;
-(void)action_addChildVC:(NSDictionary *)requitedParam;


/**
 * 设置tarbar中间圆形控件的点击时要执行的代码块
 *
 *
 */
+ (void)action_setTabBarMiddleBtnClick: (void(^)(BOOL isPlaying))middleClickBlock;
/**
 * 设置全局的导航栏背景图片
 *
 *
 *@param globalImg 全局导航栏背景图片
 *
 */
+ (void)action_setNavBarGlobalBackGroundImage: (UIImage *)globalImg;

/**
 *设置全局导航栏标题颜色 和文字大小
 *
 *@param globalTextColor  全局导航栏标题颜色
 *@param fontSize         全局导航栏文字大小
 *
 */

+ (void)action_setNavBarGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize;

/**
 * 快速获取中间按钮视图
 *
 *@return 返回中间按钮，通过通知 playState ,playImage 控制 播放和播放图片
 */
+ (UIView *)action_middleView;


- (void)notFound:(id)params;
@end

NS_ASSUME_NONNULL_END
