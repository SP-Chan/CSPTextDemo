//
//  UIViewController+KDEmptyDataSet.m
//  GYThinkingEducation
//
//  Created by 李康德 on 16/12/6.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import "UIViewController+KDEmptyDataSet.h"

@implementation UIViewController (KDEmptyDataSet)

#pragma mark - DZNEmptyDataSetSource Methods
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    return scrollView.emptyTitle;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    return nil;
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return scrollView.emptyImage;
}
- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor colorWithHexString:@"#efefef"];
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    CGFloat  verticalOffset = scrollView.verticalOffset;
    return verticalOffset;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return 20.0f;
}

#pragma mark - DZNEmptyDataSetDelegate Methods
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return NO;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return scrollView.emptyButtonImage;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    if (scrollView.emptyButtonClickBlock)
    {
        scrollView.emptyButtonClickBlock();
    }
}

- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView
{
    if (scrollView.emptyDataSetWillAppearBlock)
    {
        scrollView.emptyDataSetWillAppearBlock();
    }
}

@end


@implementation UIView (KDEmptyDataSet)


#pragma mark - DZNEmptyDataSetSource Methods
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    return scrollView.emptyTitle;
}
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    return nil;
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return scrollView.emptyImage;
}
- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor colorWithHexString:@"#efefef"];
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    CGFloat  verticalOffset = scrollView.verticalOffset;
    return verticalOffset;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return 20.0f;
}

#pragma mark - DZNEmptyDataSetDelegate Methods
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return NO;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return scrollView.emptyButtonImage;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    if (scrollView.emptyButtonClickBlock)
    {
        scrollView.emptyButtonClickBlock();
    }
}

- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView
{
    if (scrollView.emptyDataSetWillAppearBlock)
    {
        scrollView.emptyDataSetWillAppearBlock();
    }
}

@end







