//
//  NSString+Extension.m
//  EWallet
//
//  Created by tom on 14-7-17.
//  Copyright (c) 2014年 ucsmy. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


+ (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string.lowercaseString isEqualToString:@"<null>"] || [string.lowercaseString isEqualToString:@"\"null\""]){
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (NSString *)stringWithDoubleTypeConversion:(double)doubleValue
{
    NSString *doubleString        = [NSString stringWithFormat:@"%lf", doubleValue];
    NSDecimalNumber *doubleNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    NSString *tempString          = [doubleNumber stringValue];
    return tempString;
}

// 是否n位数字
- (BOOL)isNumberWithPieces:(NSUInteger)pieces{
    NSString * regex = [NSString stringWithFormat:@"^[0-9]{%zd}$", pieces];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

//限制textField输入字数
+ (BOOL)shouldChangeCharactersForNumberInTextfield:(UITextField *)textField Range:(NSRange)range string:(NSString *)string andLimitNumber:(NSUInteger)number{
    
    if (![self isLegalNumberString:string]) {
        return NO;
    }

    return [self shouldChangeCharactersInTextfield:textField Range:range string:string andLimitNumber:number];
}

//限制textField输入字数
+ (BOOL)shouldChangeCharactersInTextfield:(UITextField *)textField Range:(NSRange)range string:(NSString *)string andLimitNumber:(NSUInteger)number{
 
    if (range.length + range.location > textField.text.length) {
        
        return NO;
    }
    NSUInteger newLength = textField.text.length + string.length - range.length;
    return newLength <= number;
}

/**
 *  判断是否是数字
 *
 */
+ (BOOL)isLegalNumberString:(NSString *)string{
    
    NSString *stringRegex = @"^[0-9]*$";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    return [stringTest evaluateWithObject:string];
}

/**
 *  判断是否是数字或者字母
 *
 */
+ (BOOL)isLegalNumberOrLetterString:(NSString *)string{
    NSString *stringRegex = @"^[A-Za-z0-9]*$";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    return [stringTest evaluateWithObject:string];
}

- (NSString *)URLEncodedString
{
    
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)self,NULL,(CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                 CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}

-(NSString *)conversionTime
{
    NSUInteger seconds = [self longLongValue] * 0.001;
    //获取当前时间
    NSDate *taday = [NSDate date];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDate *taday1 = [self conversionDate:taday];
    NSDate *date1 = [self conversionDate:date];
    NSUInteger intervalTime = [date1 timeIntervalSinceReferenceDate] - [taday1 timeIntervalSinceReferenceDate];
    NSInteger days = intervalTime / (24 * 60 * 60);
    return [NSString stringWithFormat:@"%zd",days];
}

-(NSDate *)conversionDate:(NSDate *)date
{
    NSDateFormatter  *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *locationString = [dateformatter stringFromDate:date];
    NSArray *dateArr = [locationString componentsSeparatedByString:@" "];
    return [dateformatter dateFromString:[NSString stringWithFormat:@"%@ 00:00:00",dateArr.firstObject]];
}

-(NSString *)formatToBankNum_4num
{
    if (self.length > 4)
    {
        return [NSString stringWithFormat:@"**** **** **** %@",[self substringWithRange:NSMakeRange(self.length-4, 4)]];
    }
    else
    {
        return self;
    }
}

-(BOOL)isLegalPassWord
{
    return (self.length >=6 && self.length <= 16);
}

///时间字符串转时间戳
-(NSTimeInterval)dateStringToTimeStampWithDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    NSDate *date = [dateFormatter dateFromString:self];
    return [date timeIntervalSince1970];
}

///时间戳转时间字符串
-(NSString *)timeStampToDateStringWithDateFormat:(NSString *)dateFormat
{
    NSTimeInterval timeStamp = [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return [dateFormatter stringFromDate:date];
}

/**
 *  判断是否是合法手机号，目前的手机号规则是统一8~11
 *
 */
+ (BOOL)isLegalPhoneNumberString:(NSString *)string
{
    if (![self isLegalNumberString:string]) return NO;
    BOOL flag = (string.length <= 11 && string.length >= 8);
    return flag;
}


@end
