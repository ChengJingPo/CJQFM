//
//  CALayer+PauseAimate.h
//  CJQFM
//
//  Created by cjq on 2018/12/5.
//  Copyright © 2018 cjq. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (PauseAimate)

//暂停动画
- (void)pauseAnimate;

//恢复动画
- (void)resumeAnimate;
@end

NS_ASSUME_NONNULL_END
