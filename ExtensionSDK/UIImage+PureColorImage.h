//
//  UIImage+PureColorImage.h
//  GYThinkingEducation
//
//  Created by P_man on 2018/11/19.
//  Copyright © 2018年 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (PureColorImage)

+ (UIImage *)imageWithPureColor:(UIColor *)color;
+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor;
+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
+ (UIImage *)imageWithPureColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth corners:(UIRectCorner)corners;

@end

NS_ASSUME_NONNULL_END
