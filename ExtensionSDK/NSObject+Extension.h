//
//  NSObject+Extension.h
//  GYThinkingEducation
//
//  Created by Kangde Li on 2018/9/27.
//  Copyright © 2018年 gaiying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
+ (BOOL)isNull:(id)object;
///获取当前网速--转成字符串
+ (NSString *)getCurrentByteRate;
///获取当前网速
+ (long long) getInterfaceBytes;
///开通会员
+ (void)openVIPWithCategoryOneId:(NSString *)categoryOneId successBlock:(void(^)())successBlock;
@end
