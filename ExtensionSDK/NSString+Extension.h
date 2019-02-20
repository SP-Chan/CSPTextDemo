//
//  NSString+Extension.h
//  EWallet
//
//  Created by tom on 14-7-17.
//  Copyright (c) 2014年 ucsmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
+ (BOOL)isBlankString:(NSString *)string;

+ (NSString *)stringWithDoubleTypeConversion:(double)doubleValue;
// 是否n位数字
- (BOOL)isNumberWithPieces:(NSUInteger)pieces;
//限制textField输入字数
+ (BOOL)shouldChangeCharactersForNumberInTextfield:(UITextField *)textField Range:(NSRange)range string:(NSString *)string andLimitNumber:(NSUInteger)number;

//限制textField输入字数
+ (BOOL)shouldChangeCharactersInTextfield:(UITextField *)textField Range:(NSRange)range string:(NSString *)string andLimitNumber:(NSUInteger)number;

/**
 *  判断是否是数字
 *
 */
+ (BOOL)isLegalNumberString:(NSString *)string;

/**
 *  判断是否是数字或者字母
 *
 */
+ (BOOL)isLegalNumberOrLetterString:(NSString *)string;
/**
 *  判断是否是合法手机号，目前的手机号规则是统一8~11
 *
 */
+ (BOOL)isLegalPhoneNumberString:(NSString *)string;
///时间戳转时间字符串
-(NSString *)timeStampToDateStringWithDateFormat:(NSString *)dateFormat;
///时间字符串转时间戳
-(NSTimeInterval)dateStringToTimeStampWithDateFormat:(NSString *)dateFormat;

- (NSString *)URLEncodedString;
- (NSString *)conversionTime;
- (NSString *)formatToBankNum_4num;
- (BOOL)isLegalPassWord;
@end
