//
//  UIFont+WKFont.m
//  GYThinkingEducation
//
//  Created by brant on 2019/1/23.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import "UIFont+WKFont.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@implementation UIFont (WKFont)

///如果是需要在iOS9之后版本使用苹方字体，可以使用以下的替换方法

//+ (void)load
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = self;
//        Method origMethod = class_getClassMethod(class, @selector(fontWithName:size:));
//        Method altMethod = class_getClassMethod(class, @selector(wkFontWithName:size:));
//        if (!origMethod || !altMethod)
//        {
//            return;
//        }
//        Class metaClass = object_getClass(class);
//        BOOL didAddMethod = class_addMethod(metaClass,@selector(fontWithName:size:),
//                                            method_getImplementation(altMethod),
//                                            method_getTypeEncoding(altMethod));
//
//        if (didAddMethod)
//        {
//            class_replaceMethod(metaClass,@selector(wkFontWithName:size:),
//                                method_getImplementation(origMethod),
//                                method_getTypeEncoding(origMethod));
//        }
//        else
//        {
//            method_exchangeImplementations(origMethod, altMethod);
//        }
//    });
//}
//
//
//+ (nullable UIFont *)wkFontWithName:(NSString *)fontName size:(CGFloat)fontSize
//{
//    if (@available(iOS 9.0, *))
//    {
//        return [self wkFontWithName:fontName size:fontSize];
//    }
//    else
//    {
//        if ([fontName containsString:@"PingFangSC"] )
//        {
//            if ([fontName isEqualToString:@"PingFangSC-Semibold"])
//            {
//                fontName = @"HelveticaNeue-Bold";
//            }
//            else if ([fontName isEqualToString:@"PingFangSC-Medium"])
//            {
//                fontName = @"HelveticaNeue-Medium";
//            }
//            else
//            {
//                fontName = @"HelveticaNeue";
//            }
//        }
//    }
//    return [self wkFontWithName:fontName size:fontSize];
//}

@end
