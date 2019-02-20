//
//  NSObject+WKSelfInvocation.h
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/25.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WKSelfInvocation)
- (NSInvocation *)wk_createInvocationWithSelector:(SEL)selector;
@end

NS_ASSUME_NONNULL_END
