//
//  UIView+TPFullScreenPosition.h
//  GYThinkingEducation
//
//  Created by P_man on 2018/11/29.
//  Copyright © 2018年 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TPFullScreenPosition)
/**
 vc的wrapperView，iOS 8 / 9 / 10 下和屏幕大小一样
 
 @return result
 */
- (UIView *)tp_topFullScreenWrapperView;


/**
 View相对于整个屏幕的frame
 
 @return result
 */
- (CGRect)tp_fullScreenViewFrame;


/**
 View相对于整个屏幕的方形frame
 
 @param useLongSide 是否使用长边计算方形
 @return result
 */
- (CGRect)tp_fullScreenViewSquareFrameUseLongSide:(BOOL)useLongSide;


/**
 View相对于整个屏幕的frame
 
 @param expandSize 拓展size
 @return result
 */
- (CGRect)tp_fullScreenViewFrameWithExpand:(CGSize)expandSize;


/**
 View中心点相对整个屏幕的位置
 
 @return result
 */
- (CGPoint)tp_fullScreenViewCenter;


/**
 View相对于整个屏幕的frame
 
 @param expandSize 拓展size
 @param centerOffset 中心offset
 @return result
 */
- (CGRect)tp_fullScreenViewFrameWithExpand:(CGSize)expandSize centerOffset:(CGPoint)centerOffset;


/**
 扩展View相对于整个屏幕的方形frame
 
 @param expandSize 拓展size
 @param centerOffset 中心offset
 @return result
 */
- (CGRect)tp_fullScreenViewSquareFrameWithExpand:(CGSize)expandSize centerOffset:(CGPoint)centerOffset;
@end

NS_ASSUME_NONNULL_END
