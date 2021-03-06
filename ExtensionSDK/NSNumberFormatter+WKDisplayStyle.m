//
//  NSNumberFormatter+WKDisplayStyle.m
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/31.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import "NSNumberFormatter+WKDisplayStyle.h"

@implementation NSNumberFormatter (WKDisplayStyle)

/**
 关注数格式化
 
 1）数字最大显示到  9999；
 2）到达 “万” 时，向下取一位小数，显示 “万”，例如   12,599  显示为  1.2万；
 3）到达 “亿” 时，向下取两位小数，显示 “亿”，例如    125,999,999  显示为  1.25亿。
 
 @param followNumber 关注数NSNumber对象
 @return 结果
 */
+ (NSString *)wk_followNumberStringFromNumber:(NSNumber *)followNumber{
    NSString *result = @"";
    CGFloat number = followNumber.floatValue;
    
    if (number < 10000.0f){
        result = followNumber.stringValue;
    }else if (number < 100000000.0f){
        if ((NSInteger)number % 10000 != 0){
            result = [NSString stringWithFormat:@"%.1lf万", number / 10000.0f];
        }else{
            result = [NSString stringWithFormat:@"%.0lf万", number / 10000.0f];
        }
    }else{
        if ((NSInteger)number % 100000000 != 0){
            result = [NSString stringWithFormat:@"%.2lf亿", number / 100000000.0f];
        }else{
            result = [NSString stringWithFormat:@"%.0lf亿", number / 100000000.0f];
        }
    }
    
    return result;
}


@end
