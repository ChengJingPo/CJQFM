//
//  CALayer+PauseAimate.m
//  CJQFM
//
//  Created by cjq on 2018/12/5.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "CALayer+PauseAimate.h"

@implementation CALayer (PauseAimate)

- (void)pauseAnimate {
    
    CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.speed = 0.0;
    self.timeOffset = pausedTime;
    
}

- (void)resumeAnimate {
    
    CFTimeInterval pausedTime = [self timeOffset];
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() fromLayer:nil ] - pausedTime;
    self.beginTime = timeSincePause;
    
}

@end
