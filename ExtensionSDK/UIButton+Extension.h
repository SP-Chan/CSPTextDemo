//
//  UIButton+Extension.h
//  GYThinkingEducation
//
//  Created by 李康德 on 16/11/19.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>

// 图片跟标题的排列方式
typedef NS_ENUM(NSUInteger, ButtonEdgeInsetsStyle) {
    ButtonEdgeInsetsStyleImageLeft,     // 图片在左边
    ButtonEdgeInsetsStyleImageRight,    // 图片在右边
    ButtonEdgeInsetsStyleImageTop,      // 图片在上边
    ButtonEdgeInsetsStyleImageBottom    // 图片在下面
};

@interface UIButton (Extension)
/*** 标题、字体颜色、背景颜色、字体大小*/
-(nullable instancetype)initWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor backgroundColor:(nullable UIColor *)backgroundColor font:(nullable UIFont *)font target:(nullable id)target action:(nullable SEL)action;
/*** 标题、字体颜色、字体大小*/
-(nullable instancetype)initWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor font:(nullable UIFont *)font target:(nullable id)target action:(nullable SEL)action;
/*** 字体颜色、字体大小*/
-(nullable instancetype)initWithFrame:(CGRect)frame titleColor:(nullable UIColor *)titleColor font:(nullable UIFont *)font target:(nullable id)target action:(nullable SEL)action;
/*** 标题、字体颜色、按钮小照片、字体大小*/
-(nullable instancetype)initWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor font:(nullable UIFont *)font target:(nullable id)target action:(nullable SEL)action imageName:(nullable NSString *)imageName;
/*** 标题、字体颜色、背景照片、字体大小*/
-(nullable instancetype)initWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor font:(nullable UIFont *)font target:(nullable id)target action:(nullable SEL)action backgroundImageName:(nullable NSString *)backgroundImageName;
/*** 标题、字体颜色、按钮小照片、字体大小、没有target和action*/
-(nullable instancetype)initWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor font:(nullable UIFont *)font imageName:(nullable NSString *)imageName;
/*** 标题、字体颜色、背景照片、字体大小、没有target和action*/
-(nullable instancetype)initWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor font:(nullable UIFont *)font backgroundImageName:(nullable NSString *)backgroundImageName;
/*** 标题、字体颜色、背景颜色、字体大小、没有target和action*/
-(nullable instancetype)initWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor font:(nullable UIFont *)font backgroundColor:(nullable UIColor *)backgroundColor;
/*** 背景照片*/
-(nullable instancetype)initWithFrame:(CGRect)frame backgroundImageName:(nullable NSString *)backgroundImageName target:(nullable id)target action:(nullable SEL)action;
/*** 背景小照片*/
-(nullable instancetype)initWithFrame:(CGRect)frame imageName:(nullable NSString *)imageName target:(nullable id)target action:(nullable SEL)action;
/*** 背景小照片、没有target和action*/
-(nullable instancetype)initWithFrame:(CGRect)frame imageName:(nullable NSString *)imageName;
-(void)circleButton;
-(void)circleButtonWithBorderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor;


- (void)show;
- (void)hide;
/**
 设置图片与标题的位置样式及图片与标题的间距
 
 @param style 图片与标题的位置样式
 @param space 图片与标题的间距
 */
- (void)yt_layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space;

/** 设置可点击范围到按钮边缘的距离 */
- (void)kd_setEnlargeEdge:(CGFloat)size;

/** 设置可点击范围到按钮上、右、下、左的距离 */
- (void)kd_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
@end
