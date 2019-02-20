//
//  UIView+Extension.h
//  GYThinkingEducation
//
//  Created by 李康德 on 16/11/24.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
- (UINavigationController *)getCurrentTopViewController;
/// 关闭返回手势
-(void)closePopGestureRecognizer;
/// 开启返回手势
-(void)openPopGestureRecognizer;
-(UIImage *)capture;
    
#pragma mark - 设置部分圆角
    /**
     *  设置部分圆角(绝对布局)
     *
     *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
     *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
     */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
    /**
     *  设置部分圆角(相对布局)
     *
     *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
     *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
     *  @param rect    需要设置的圆角view的rect
     */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;
@end
