//
//  UIColor+HexColors.m
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2018/11/15.
//  Copyright © 2018 gaiying. All rights reserved.
//

#import "UIColor+HexColors.h"

@implementation UIColor (HexColors)

-(CGFloat)getColorBy:(UIColorComponentIndices)index {
    CGColorRef colorRef = [self CGColor];
    
    int _countComponents = CGColorGetNumberOfComponents(colorRef);
    
    if (_countComponents == 4) {
        const CGFloat *_components = CGColorGetComponents(colorRef);
        CGFloat red     = _components[0];
        CGFloat green = _components[1];
        CGFloat blue   = _components[2];
        CGFloat alpha = _components[3];
        
        //NSLog(@"%f,%f,%f,%f",red,green,blue,alpha);
        if(index == TPR) {
            return red;
        } else if(index == TPG) {
            return green;
        } else if(index == TPB) {
            return blue;
        } else if(index == TPA) {
            return alpha;
        }
    }
    
    return 0;
}

+(UIColor *)colorWithHexString:(NSString *)hexString {
    
    
    // cuts # from the string
    if([hexString length] >= 1 && [hexString characterAtIndex:0] == '#') {
        hexString = [hexString substringFromIndex:1];
    }
    
    // Brutal and not-very elegant test for non hex-numeric characters
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^a-fA-F|0-9]" options:0 error:NULL];
    NSUInteger match = [regex numberOfMatchesInString:hexString options:NSMatchingReportCompletion range:NSMakeRange(0, [hexString length])];
    
    if (match != 0) {
        return [UIColor blackColor];
    }
    
    NSRange rRange = NSMakeRange(0, 2);
    NSString *rComponent = [hexString substringWithRange:rRange];
    NSUInteger rVal = 0;
    NSScanner *rScanner = [NSScanner scannerWithString:rComponent];
    [rScanner scanHexInt:&rVal];
    float rRetVal = (float)rVal / 255;
    
    
    NSRange gRange = NSMakeRange(2, 2);
    NSString *gComponent = [hexString substringWithRange:gRange];
    NSUInteger gVal = 0;
    NSScanner *gScanner = [NSScanner scannerWithString:gComponent];
    [gScanner scanHexInt:&gVal];
    float gRetVal = (float)gVal / 255;
    
    NSRange bRange = NSMakeRange(4, 2);
    NSString *bComponent = [hexString substringWithRange:bRange];
    NSUInteger bVal = 0;
    NSScanner *bScanner = [NSScanner scannerWithString:bComponent];
    [bScanner scanHexInt:&bVal];
    float bRetVal = (float)bVal / 255;
    
    CGFloat alpha = 1.0f;
    
    if (hexString.length >= 8){
        
        NSRange aRange = NSMakeRange(6, 2);
        NSString *aComponent = [hexString substringWithRange:aRange];
        NSUInteger aVal = 0;
        NSScanner *aScanner = [NSScanner scannerWithString:aComponent];
        [aScanner scanHexInt:&aVal];
        alpha = (float)aVal / 255;
    }
    
    return [UIColor colorWithRed:rRetVal green:gRetVal blue:bRetVal alpha:alpha];
    
}

+(UIColor *)colorWithHexString:(NSString *)hexString alph:(CGFloat)alpha
{
    // cuts # from the string
    if([hexString length] == 7 && [hexString characterAtIndex:0] == '#') {
        hexString = [hexString substringFromIndex:1];
    } else if ([hexString length] != 6) {
        return [UIColor blackColor];
    }
    
    // Brutal and not-very elegant test for non hex-numeric characters
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^a-fA-F|0-9]" options:0 error:NULL];
    NSUInteger match = [regex numberOfMatchesInString:hexString options:NSMatchingReportCompletion range:NSMakeRange(0, [hexString length])];
    
    if (match != 0) {
        return [UIColor blackColor];
    }
    
    NSRange rRange = NSMakeRange(0, 2);
    NSString *rComponent = [hexString substringWithRange:rRange];
    NSUInteger rVal = 0;
    NSScanner *rScanner = [NSScanner scannerWithString:rComponent];
    [rScanner scanHexInt:&rVal];
    float rRetVal = (float)rVal / 255;
    
    
    NSRange gRange = NSMakeRange(2, 2);
    NSString *gComponent = [hexString substringWithRange:gRange];
    NSUInteger gVal = 0;
    NSScanner *gScanner = [NSScanner scannerWithString:gComponent];
    [gScanner scanHexInt:&gVal];
    float gRetVal = (float)gVal / 255;
    
    NSRange bRange = NSMakeRange(4, 2);
    NSString *bComponent = [hexString substringWithRange:bRange];
    NSUInteger bVal = 0;
    NSScanner *bScanner = [NSScanner scannerWithString:bComponent];
    [bScanner scanHexInt:&bVal];
    float bRetVal = (float)bVal / 255;
    
    return [UIColor colorWithRed:rRetVal green:gRetVal blue:bRetVal alpha:alpha];
    
}

+(NSString *)hexValuesFromUIColor:(UIColor *)color {
    
    if (!color) {
        return nil;
    }
    
    if (color == [UIColor whiteColor]) {
        // Special case, as white doesn't fall into the RGB color space
        return @"ffffff";
    }
    
    CGFloat red;
    CGFloat blue;
    CGFloat green;
    CGFloat alpha;
    
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    int redDec = (int)(red * 255);
    int greenDec = (int)(green * 255);
    int blueDec = (int)(blue * 255);
    
    NSString *returnString = [NSString stringWithFormat:@"%02x%02x%02x", (unsigned int)redDec, (unsigned int)greenDec, (unsigned int)blueDec];
    
    return returnString;
    
}


@end
