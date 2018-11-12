//
//  CJQMediatorManger.h
//  CJQFM
//
//  Created by cjq on 2018/11/12.
//  Copyright © 2018 cjq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJQMediatorManger : NSObject

+ (id)performTarget: (NSString *)targetName
             action: (NSString *)actionName
             params: (id __nullable)params
             isRequiredReturnValue: (BOOL)isRequiredReturnValue;




@end

NS_ASSUME_NONNULL_END
