//
//  NSMutableAttributedString+WKTextStyle.m
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/11.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import "NSMutableAttributedString+WKTextStyle.h"

@implementation NSMutableAttributedString (WKTextStyle)
+ (instancetype)tp_mutableStringWithBaseFont:(UIFont *)font color:(UIColor *)color{
    return [NSMutableAttributedString tp_mutableStringWithBaseFont:font color:color lineSpacing:4.0f];
}

+ (instancetype)tp_mutableStringWithBaseFont:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing{
    if (font && color){
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = lineSpacing;
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
        [attributedString addAttributes:@{NSParagraphStyleAttributeName:style,
                                          NSFontAttributeName:font,
                                          NSForegroundColorAttributeName:color} range:NSMakeRange(0, attributedString.length)];
        
        return attributedString;
    }
    
    return nil;
}

+ (instancetype)tp_mutableStringWithString:(NSString *)string baseFont:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing
{
    if (font && color && string) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = lineSpacing;
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        [attributedString addAttributes:@{NSParagraphStyleAttributeName:style,
                                          NSFontAttributeName:font,
                                          NSForegroundColorAttributeName:color} range:NSMakeRange(0, attributedString.length)];
        
        return attributedString;
    }
    
    return nil;
}

- (void)tp_appendString:(NSString *)string{
    [self tp_appendString:string font:nil color:nil];
}

- (void)tp_appendString:(NSString *)string font:(UIFont *)font color:(UIColor *)color{
    
    [self tp_appendString:string font:font color:color lineSpacing:0.0];
}

- (void)tp_appendString:(NSString *)string font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing
{
    if (!string || string.length == 0){
        return ;
    }
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    
    if (font){
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    
    if (color){
        [attributes setObject:color forKey:NSForegroundColorAttributeName];
    }
    
    if (lineSpacing > 0) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = lineSpacing;
        
        [attributes setObject:style forKey:NSParagraphStyleAttributeName];
    }
    
    [attributes setObject:@0 forKey:NSBaselineOffsetAttributeName];
    
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:string
                                                                          attributes:attributes];
    
    [self appendAttributedString:attributeString];
}

- (void)tp_appendLevelScoreStringWithScore:(NSInteger)score font:(UIFont *)font{
    UIColor *fontColor = nil;
    NSString *scoreString = nil;
    
    if (score >= 90){
        fontColor = [UIColor colorWithHexString:@"FFA200"];
        scoreString = @"S";
    }else if (score >= 80){
        fontColor = [UIColor colorWithHexString:@"FC6970"];
        scoreString = @"A";
    }else if (score >= 70){
        fontColor = [UIColor colorWithHexString:@"FFCC00"];
        scoreString = @"B";
    }else if (score > 60){
        fontColor = [UIColor colorWithHexString:@"55C1FF"];
        scoreString = @"C";
    }else{
        fontColor = [UIColor colorWithHexString:@"999999"];
        scoreString = @"D";
    }
    
    NSString *string = [NSString stringWithFormat:@"%@级 %@分 ", scoreString, @(score)];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName: fontColor}];
    
    [self appendAttributedString:attributedString];
}

- (void)tp_replaceTextStyleOfString:(NSString *)string withFont:(UIFont *)font color:(UIColor *)color
{
    if (string) {
        NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
        if (font){
            [attributes setObject:font forKey:NSFontAttributeName];
        }
        
        if (color){
            [attributes setObject:color forKey:NSForegroundColorAttributeName];
        }
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string
                                                                                             attributes:attributes];
        
        NSRange range = [self.string rangeOfString:string];
        if (range.location != NSNotFound && attributedString) {
            [self replaceCharactersInRange:range withAttributedString:attributedString];
        }
    }
}

- (void)tp_replaceTextStyleOfString:(NSString *)string withColor:(UIColor *)color
{
    [self tp_replaceTextStyleOfString:string withFont:nil color:color];
}

- (void)tp_appendUnderlineStyleString:(NSString *)string font:(UIFont *)font color:(UIColor *)color {
    if (!string || string.length == 0){
        return ;
    }
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    
    if (font){
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    
    if (color){
        [attributes setObject:color forKey:NSForegroundColorAttributeName];
    }
    
    [attributes setObject:[NSNumber numberWithInteger:NSUnderlineStyleSingle] forKey:NSUnderlineStyleAttributeName];
    
    [attributes setObject:@0 forKey:NSBaselineOffsetAttributeName];
    
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:string
                                                                          attributes:attributes];
    
    [self appendAttributedString:attributeString];
}
@end
