//
//  UIView+TPFullScreenPosition.m
//  GYThinkingEducation
//
//  Created by P_man on 2018/11/29.
//  Copyright © 2018年 gaiying. All rights reserved.
//

#import "UIView+TPFullScreenPosition.h"

@implementation UIView (TPFullScreenPosition)
- (UIView *)tp_topFullScreenWrapperView{
    return self.superview ? [self tp_topViewControllerParentViewForSubView:self.superview] : nil;
}

- (CGRect)tp_fullScreenViewFrameWithExpand:(CGSize)expandSize{
    return [self tp_fullScreenViewFrameWithExpand:expandSize centerOffset:CGPointZero];
}

- (CGRect)tp_fullScreenViewFrameWithExpand:(CGSize)expandSize centerOffset:(CGPoint)centerOffset{
    CGRect resultFrame = [self tp_fullScreenViewFrame];
    
    if (!CGSizeEqualToSize(expandSize, CGSizeZero)){
        resultFrame = CGRectMake(resultFrame.origin.x - expandSize.width / 2.0f,
                                 resultFrame.origin.y - expandSize.height / 2.0f,
                                 resultFrame.size.width + expandSize.width,
                                 resultFrame.size.height + expandSize.height);
    }
    
    if (!CGPointEqualToPoint(centerOffset, CGPointZero)){
        resultFrame = CGRectMake(resultFrame.origin.x + centerOffset.x,
                                 resultFrame.origin.y + centerOffset.y,
                                 resultFrame.size.width,
                                 resultFrame.size.height);
    }
    
    return resultFrame;
}

- (CGRect)tp_fullScreenViewSquareFrameWithExpand:(CGSize)expandSize centerOffset:(CGPoint)centerOffset{
    CGRect resultFrame = [self tp_fullScreenViewSquareFrameUseLongSide:YES];
    
    if (!CGSizeEqualToSize(expandSize, CGSizeZero)){
        resultFrame = CGRectMake(resultFrame.origin.x - expandSize.width / 2.0f,
                                 resultFrame.origin.y - expandSize.height / 2.0f,
                                 resultFrame.size.width + expandSize.width,
                                 resultFrame.size.height + expandSize.height);
    }
    
    if (!CGPointEqualToPoint(centerOffset, CGPointZero)){
        resultFrame = CGRectMake(resultFrame.origin.x + centerOffset.x,
                                 resultFrame.origin.y + centerOffset.y,
                                 resultFrame.size.width,
                                 resultFrame.size.height);
    }
    
    return resultFrame;
}

- (CGRect)tp_fullScreenViewFrame{
    if (self.superview){
        UIView *topSuperView = [self tp_topFullScreenWrapperView];
        
        if (topSuperView){
            return [topSuperView convertRect:self.frame fromView:self.superview];
        }
    }
    
    return CGRectZero;
}

- (CGRect)tp_fullScreenViewSquareFrameUseLongSide:(BOOL)useLongSide
{
    CGRect frame = [self tp_fullScreenViewFrame];
    if (frame.size.width == frame.size.height) {
        return frame;
    }
    
    CGFloat longSide = frame.size.height;
    CGFloat shortSide = frame.size.width;
    if (frame.size.width > frame.size.height) {
        longSide = frame.size.width;
        shortSide = frame.size.height;
    }
    
    CGFloat squareSide = useLongSide ? longSide : shortSide;
    
    CGFloat centerX = frame.origin.x + frame.size.width / 2.0;
    CGFloat centerY = frame.origin.y + frame.size.height / 2.0;
    
    return CGRectMake(centerX - squareSide / 2.0, centerY - squareSide / 2.0, squareSide, squareSide);
}

- (CGPoint)tp_fullScreenViewCenter
{
    if (self.superview){
        UIView *topSuperView = [self tp_topFullScreenWrapperView];
        
        if (topSuperView){
            return [topSuperView convertPoint:self.center fromView:self.superview];
        }
    }
    
    return CGPointZero;
}

#pragma mark - Private Methods

- (UIView *)tp_topViewControllerParentViewForSubView:(UIView *)subView{
    if (!NSClassFromString(@"UIViewControllerWrapperView")){
        //没有这个Class
        return nil;
    }
    
    if ([subView isKindOfClass:[NSClassFromString(@"UIViewControllerWrapperView") class]]){
        return subView;
    }
    
    if (subView.superview){
        return [self tp_topViewControllerParentViewForSubView:subView.superview];
    }else{
        return nil;
    }
}
@end
