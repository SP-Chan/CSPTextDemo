//
//  UIView+Extension.m
//  GYThinkingEducation
//
//  Created by 李康德 on 16/11/24.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (UINavigationController *)getCurrentTopViewController
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([rootViewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        UINavigationController *navigationController = tabBarController.selectedViewController;
        return navigationController;
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]])
    {
        return (UINavigationController *)rootViewController;
    }
    else
    {
        return rootViewController.navigationController;
    }
}

/// 关闭返回手势
-(void)closePopGestureRecognizer
{
    UINavigationController *navigationController = [self getCurrentTopViewController];
    navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
}

/// 开启返回手势
-(void)openPopGestureRecognizer
{
    UINavigationController *navigationController = [self getCurrentTopViewController];
    navigationController.fd_fullscreenPopGestureRecognizer.enabled = YES;
}
-(UIImage *)capture
{
    // 开启图形上下文（基于图片的上下文）
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    // 将控制器view的所有内容渲染到当前上下文中
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 从图形上下文获得图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    return newImage;
}
    
#pragma mark - 设置部分圆角
    /**
     *  设置部分圆角(绝对布局)
     *
     *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
     *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
     */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
    {
        
        UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        [shape setPath:rounded.CGPath];
        
        self.layer.mask = shape;
    }
    
    /**
     *  设置部分圆角(相对布局)
     *
     *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
     *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
     *  @param rect    需要设置的圆角view的rect
     */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect
    {
        
        UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        [shape setPath:rounded.CGPath];
        
        self.layer.mask = shape;
    }
@end
