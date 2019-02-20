//
//  UIViewController+WKNavigationBarStyle.m
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/9.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import "UIViewController+WKNavigationBarStyle.h"
#import "UIImage+PureColorImage.h"
#import "UIColor+HexColors.h"

@implementation UIViewController (WKNavigationBarStyle)
- (void)configNavigationBar{
    if (self.navigationController && self.navigationController.navigationBar){
        //background image
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithPureColor:[UIColor whiteColor]]
                                                      forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage imageWithPureColor:[UIColor colorWithHexString:@"F2F2F2"]]];
        
        //title attributes
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithHexString:@"222222"],
                                              NSFontAttributeName : TP_GLOBAL_BODY_FONT_SIZE(18.0)};
        self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
        
        //tint color
        self.navigationController.navigationBar.tintColor = [UIColor colorWithHexString:@"222222"];
        
        //translucent
        self.navigationController.navigationBar.translucent = NO;
        
        //status bar, Deprecated in iOS 9.0
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        self.navigationItem.backBarButtonItem.title = @"";
    }
}

- (void)configPinkNavigationBar{
    if (self.navigationController && self.navigationController.navigationBar){
        //background image
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar"]
                                                      forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:nil];
        
        //title attributes
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithHexString:@"ffffff"],
                                              NSFontAttributeName : TP_GLOBAL_BODY_FONT_SIZE(18.0)};
        self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
        
        //tint color
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        //translucent
        self.navigationController.navigationBar.translucent = NO;
        
        //status bar, Deprecated in iOS 9.0
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        self.navigationItem.backBarButtonItem.title = @"";
    }
}

- (void)configDarkColorNavigationBar{
    if (self.navigationController && self.navigationController.navigationBar){
        //background image
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithPureColor:[UIColor colorWithHexString:@"1e2036"]]
                                                      forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:nil];
        
        //title attributes
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithHexString:@"ffffff"],
                                              NSFontAttributeName : TP_GLOBAL_BODY_FONT_SIZE(18.0)};
        self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
        
        //tint color
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        //translucent
        self.navigationController.navigationBar.translucent = NO;
        
        //status bar, Deprecated in iOS 9.0
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        self.navigationItem.backBarButtonItem.title = @"";
    }
}

- (void)configLightBrownColorNavigationBar {
    if (self.navigationController && self.navigationController.navigationBar){
        //background image
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithPureColor:[UIColor colorWithHexString:@"181818"]]
                                                      forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:nil];
        
        //title attributes
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithHexString:@"ffffff"],
                                              NSFontAttributeName : TP_GLOBAL_BODY_FONT_SIZE(18.0)};
        self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
        
        //tint color
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        //translucent
        self.navigationController.navigationBar.translucent = NO;
        
        //status bar, Deprecated in iOS 9.0
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        self.navigationItem.backBarButtonItem.title = @"";
    }
}

- (void)tp_configNavigationBarBackButton{
    if (!self.navigationItem.leftBarButtonItem){
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem *dismissBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon-navi-back"] style:UIBarButtonItemStylePlain target:self action:@selector(tp_didTappedBackButton)];
        self.navigationItem.leftBarButtonItem = dismissBarButtonItem;
    }
}

- (void)tp_configNavigationBarCloseButton{
    if (!self.navigationItem.leftBarButtonItem){
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem *dismissBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"editor_panel_close"] style:UIBarButtonItemStylePlain target:self action:@selector(tp_didTappedBackButton)];
        self.navigationItem.leftBarButtonItem = dismissBarButtonItem;
    }
}

- (void)tp_decideShouldHideNavigationBarWithScrollingScrollView:(UIScrollView *)scrollView shouldHideStatusBar:(BOOL)flag{
    CGFloat velocity = [scrollView.panGestureRecognizer velocityInView:scrollView].y;
    
    BOOL shouldToggleShowNavigationBar = NO;
    BOOL shouldShowNavigationBar = NO;
    if (velocity > 30) {
        shouldToggleShowNavigationBar = YES;
        shouldShowNavigationBar = YES;
    }else if(velocity < -30){
        shouldToggleShowNavigationBar = YES;
        shouldShowNavigationBar = NO;
    }
    
    if (self.navigationController.navigationBarHidden != shouldShowNavigationBar
        || !shouldToggleShowNavigationBar){
        return ;
    }
    
    if (shouldShowNavigationBar) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (void)tp_didTappedBackButton{
    if (self.navigationController.viewControllers.count == 1){
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
