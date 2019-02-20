//
//  UIImage+PureColorImage.m
//  GYThinkingEducation
//
//  Created by P_man on 2018/11/19.
//  Copyright © 2018年 gaiying. All rights reserved.
//

#import "UIImage+PureColorImage.h"

@implementation UIImage (PureColorImage)

+ (UIImage *)imageWithPureColor:(UIColor *)color{
    return [UIImage imageWithPureColor:color
                                  size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size{
    return [UIImage imageWithPureColor:color
                                  size:size
                          cornerRadius:0.0f];
}

+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius{
    return [UIImage imageWithPureColor:color
                                  size:size
                          cornerRadius:cornerRadius
                           borderColor:nil];
}

+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor{
    return [UIImage imageWithPureColor:color
                                  size:size
                          cornerRadius:cornerRadius
                           borderColor:borderColor
                           borderWidth:1.5f / [UIScreen mainScreen].scale];
}


+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    return [UIImage imageWithPureColor:color
                                  size:size
                          cornerRadius:cornerRadius
                           borderColor:borderColor
                           borderWidth:borderWidth
                               corners:UIRectCornerAllCorners];
}

+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth corners:(UIRectCorner)corners{
    if (corners != UIRectCornerAllCorners) {
        UIRectCorner tmp = 0;
        if (corners & UIRectCornerTopLeft) tmp |= UIRectCornerBottomLeft;
        if (corners & UIRectCornerTopRight) tmp |= UIRectCornerBottomRight;
        if (corners & UIRectCornerBottomLeft) tmp |= UIRectCornerTopLeft;
        if (corners & UIRectCornerBottomRight) tmp |= UIRectCornerTopRight;
        corners = tmp;
    }
    
    CGRect imageRect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [color set];
    [[UIBezierPath bezierPathWithRoundedRect:imageRect
                           byRoundingCorners:corners
                                 cornerRadii:CGSizeMake(cornerRadius, borderWidth)] addClip];
    UIRectFill(imageRect);
    
    if (borderColor && size.width > 6.0f) {
        CGFloat scale = [UIScreen mainScreen].scale;
        CGFloat strokeInset = 0.0f;
        CGRect strokeRect = CGRectInset(imageRect, strokeInset, strokeInset);
        CGFloat strokeRadius = cornerRadius > scale / 2 ? cornerRadius - scale / 2 : 0;
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:strokeRect
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(strokeRadius, borderWidth)];
        [path closePath];
        
        path.lineWidth = borderWidth;
        path.lineJoinStyle = kCGLineJoinMiter;
        [borderColor setStroke];
        [path stroke];
    }
    
    UIImage *colorImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return colorImage;
}

@end

