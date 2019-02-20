//
//  UIBarButtonItem+QDBarButtonItem.h
//  Ewallet
//
//  Created by HenryLee on 16/7/15.
//  Copyright © 2016年 UCSMY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (QDBarButtonItem)

+ (instancetype)barButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action;
+ (instancetype)barButtonItemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;
+ (instancetype)navigationBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
