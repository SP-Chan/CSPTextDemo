//
//  UIBarButtonItem+QDBarButtonItem.m
//  Ewallet
//
//  Created by HenryLee on 16/7/15.
//  Copyright © 2016年 UCSMY. All rights reserved.
//

#import "UIBarButtonItem+QDBarButtonItem.h"

@implementation UIBarButtonItem (QDBarButtonItem)

+ (instancetype)barButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action
{
    UIButton * button = [[UIButton alloc]init];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)barButtonItemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIButton * button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)navigationBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    return [self barButtonItemWithTitle:title titleColor:KWhiteColor fontSize:15.0 target:target action:action];
}

@end
