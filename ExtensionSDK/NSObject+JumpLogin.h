//
//  NSObject+JumpLogin.h
//  GYThinkingEducation
//
//  Created by Kangde Li on 2018/8/22.
//  Copyright © 2018年 gaiying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JumpLogin)
+ (void)jumpLoginWithLoginSuccess:(KDBlock)block;
///返回跳转的控制器
+ (UIViewController *)jumpToVideoDetailsWithVideoId:(NSNumber *)videoId categoryOneId:(NSString *)categoryOneId;
@end


