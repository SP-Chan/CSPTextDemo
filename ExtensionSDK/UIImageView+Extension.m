//
//  UIImageView+Extension.m
//  GYThinkingEducation
//
//  Created by 李康德 on 16/11/23.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)

-(void)circleImageView
{
    [self circleImageViewWithBorderWidth:0 borderColor:nil];
}

-(void)circleImageViewWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    [self layoutIfNeeded];
    self.layer.cornerRadius = self.frame.size.width * 0.5;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}

@end
