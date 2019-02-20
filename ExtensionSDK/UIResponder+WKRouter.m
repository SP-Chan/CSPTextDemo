//
//  UIResponder+WKRouter.m
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/25.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import "UIResponder+WKRouter.h"

@implementation UIResponder (WKRouter)

- (void)wk_routerEventWithName:(NSString *)eventName{
    [self wk_routerEventWithName:eventName userInfo:nil];
}

- (void)wk_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    [[self nextResponder] wk_routerEventWithName:eventName userInfo:userInfo];
}

@end
