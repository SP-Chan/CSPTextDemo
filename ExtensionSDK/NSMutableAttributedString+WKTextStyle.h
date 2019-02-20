//
//  NSMutableAttributedString+WKTextStyle.h
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/11.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 设置文本内容的简易方法
 */
@interface NSMutableAttributedString (WKTextStyle)
+ (instancetype)tp_mutableStringWithBaseFont:(UIFont *)font color:(UIColor *)color;

+ (instancetype)tp_mutableStringWithBaseFont:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing;

+ (instancetype)tp_mutableStringWithString:(NSString *)string baseFont:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing;

- (void)tp_appendString:(NSString *)string;

- (void)tp_appendString:(NSString *)string font:(UIFont *)font color:(UIColor *)color;

- (void)tp_appendString:(NSString *)string font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing;

- (void)tp_appendLevelScoreStringWithScore:(NSInteger)score font:(UIFont *)font;

- (void)tp_replaceTextStyleOfString:(NSString *)string withFont:(UIFont *)font color:(UIColor *)color;

- (void)tp_replaceTextStyleOfString:(NSString *)string withColor:(UIColor *)color;

- (void)tp_appendUnderlineStyleString:(NSString *)string font:(UIFont *)font color:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
