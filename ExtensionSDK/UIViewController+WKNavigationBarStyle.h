//
//  UIViewController+WKNavigationBarStyle.h
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/9.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (WKNavigationBarStyle)
/**
 默认主题样式
 */
- (void)configNavigationBar;

/**
 FC6970配色
 */
- (void)configPinkNavigationBar;

/**
 1e2036配色
 */
- (void)configDarkColorNavigationBar;

/**
 181818配色
 */
- (void)configLightBrownColorNavigationBar;

/**
 设置左边的返回按钮为默认样式，点击后pop或者dismiss当前ViewController
 */
- (void)tp_configNavigationBarBackButton;

/**
 设置左边的返回按钮为关闭样式，点击后pop或者dismiss当前ViewController
 */
- (void)tp_configNavigationBarCloseButton;

/**
 根据scrollView当前滑动速度决定是否需要隐藏NavigationBar
 请在 scrollViewDidScroll: 方法中调用
 
 @param scrollView 滑动中的scrollView
 @param flag 是否需要隐藏StatusBar，如果为YES，请在 viewWillDisappear 重新设置 StatusBar 显示
 */
- (void)tp_decideShouldHideNavigationBarWithScrollingScrollView:(UIScrollView *)scrollView shouldHideStatusBar:(BOOL)flag;

/**
 pop或者dismiss
 */
- (void)tp_didTappedBackButton;
@end

NS_ASSUME_NONNULL_END
