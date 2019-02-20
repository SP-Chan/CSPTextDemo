//
//  NSObject+JumpLogin.m
//  GYThinkingEducation
//
//  Created by Kangde Li on 2018/8/22.
//  Copyright © 2018年 gaiying. All rights reserved.
//

#import "NSObject+JumpLogin.h"
#import "KDLoginViewController_Index.h"
#import "KDRegisteredViewController.h"
#import "KDBaseMainTabBarController.h"
#import "KDAudioDetailsViewController.h"
#import "KDVideoDetailsViewController.h"

@implementation NSObject (JumpLogin)

+(void)jumpLoginWithLoginSuccess:(KDBlock)block
{
    KDLoginViewController_Index *vc = [[KDLoginViewController_Index alloc] initWithLoginSuccess:block];
    KDBaseMainNavigationController *navi = [[KDBaseMainNavigationController alloc] initWithRootViewController:vc];
    [[QDTopViewControllerTools qd_topViewController] presentViewController:navi animated:YES completion:nil];

//    KDLoginViewController *vc = [[KDLoginViewController alloc] initWithLoginSuccess:block];
//    KDBaseMainNavigationController *navi = [[KDBaseMainNavigationController alloc] initWithRootViewController:vc];
//    [[QDTopViewControllerTools qd_topViewController] presentViewController:navi animated:YES completion:nil];
//    vc.customLeftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_close"] style:UIBarButtonItemStylePlain target:self action:@selector(toDismiss)];
//
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30) title:@"注册" titleColor:KMainColor font:[UIFont systemFontOfSize:16] target:self action:@selector(toRegistered)];
//    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

+(void)toDismiss
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [[QDTopViewControllerTools qd_topViewController] dismissViewControllerAnimated:YES completion:^{
        KDBaseMainTabBarController *tabVC = (KDBaseMainTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        tabVC.selectedIndex = 0;
    }];
}

+(void)toRegistered
{
    KDRegisteredViewController *vc = [[KDRegisteredViewController alloc] init];
    [[QDTopViewControllerTools qd_topNavigationController] pushViewController:vc animated:YES];
}


+ (UIViewController *)jumpToVideoDetailsWithVideoId:(NSNumber *)videoId categoryOneId:(NSString *)categoryOneId
{
    if ([[KDUserDefaults shareUserDefaults].hasLogin boolValue] == NO)
    {
        [NSObject jumpLoginWithLoginSuccess:nil];
        return nil;
    }
    if ([categoryOneId integerValue] == 7)
    {
        KDAudioDetailsViewController *vc = [[KDAudioDetailsViewController alloc] init];
        vc.videoId = videoId;
        vc.categoryOneId = categoryOneId;
        [[QDTopViewControllerTools qd_topNavigationController] pushViewController:vc animated:YES];
        return vc;
    }
    else
    {
        KDVideoDetailsViewController *vc = [[KDVideoDetailsViewController alloc] init];
        vc.videoId = videoId;
        [[QDTopViewControllerTools qd_topNavigationController] pushViewController:vc animated:YES];
        return vc;
    }
}

@end
