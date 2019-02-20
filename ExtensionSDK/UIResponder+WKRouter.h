//
//  UIResponder+WKRouter.h
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/25.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (WKRouter)

- (void)wk_routerEventWithName:(NSString *)eventName;

- (void)wk_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
