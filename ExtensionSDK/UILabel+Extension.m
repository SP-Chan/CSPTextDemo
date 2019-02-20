//
//  UILabel+Extension.m
//  GYThinkingEducation
//
//  Created by 李康德 on 16/11/18.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

-(instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor
{
    if (self = [super init])
    {
        self.frame = frame;
        self.font = font;
        self.textColor = textColor;
        self.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines
{
    if (self = [self initWithFrame:frame font:font textColor:textColor])
    {
        self.textAlignment = textAlignment;
        self.numberOfLines = numberOfLines;
    }
    return self;
}

@end
