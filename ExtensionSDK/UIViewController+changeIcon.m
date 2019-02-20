//
//  UIViewController+changeIcon.m
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2018/11/9.
//  Copyright © 2018 gaiying. All rights reserved.
//

#import "UIViewController+changeIcon.h"
#import <objc/runtime.h>

@implementation UIViewController (changeIcon)
//
//+(void)load{
//    Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
//    Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(ox_presentViewController:animated:completion:));
//    // 交换方法实现
//    method_exchangeImplementations(presentM, presentSwizzlingM);
//}
//
//// 自己的替换展示弹出框的方法
//- (void)ox_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
//
//    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
//        NSLog(@"title : %@",((UIAlertController *)viewControllerToPresent).title);
//        NSLog(@"message : %@",((UIAlertController *)viewControllerToPresent).message);
//
//        // 换图标时的提示框的title和message都是nil，由此可特殊处理
//        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
//        if (alertController.title == nil && alertController.message == nil) { // 是换图标的提示
//            return;
//        } else {// 其他提示还是正常处理
//            [self ox_presentViewController:viewControllerToPresent animated:flag completion:completion];
//            return;
//        }
//    }
//
//    [self ox_presentViewController:viewControllerToPresent animated:flag completion:completion];
//}

@end
