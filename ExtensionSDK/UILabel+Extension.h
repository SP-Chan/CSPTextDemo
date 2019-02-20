//
//  UILabel+Extension.h
//  GYThinkingEducation
//
//  Created by 李康德 on 16/11/18.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
-(instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor;
-(instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;
@end
