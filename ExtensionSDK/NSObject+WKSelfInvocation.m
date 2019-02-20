//
//  NSObject+WKSelfInvocation.m
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/25.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import "NSObject+WKSelfInvocation.h"

@implementation NSObject (WKSelfInvocation)
- (NSInvocation *)wk_createInvocationWithSelector:(SEL)selector{
    NSMethodSignature  *signature = [[self class] instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    return invocation;
}
@end
