//
//  NSObject+Extension.m
//  GYThinkingEducation
//
//  Created by Kangde Li on 2018/9/27.
//  Copyright © 2018年 gaiying. All rights reserved.
//

#import "NSObject+Extension.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
#import "KDPayView.h"
#import "WXApiManager.h"

@implementation NSObject (Extension)

+ (BOOL)isNull:(id)object
{
    if ([object isKindOfClass:[NSNumber class]])
    {
        object = [NSString stringWithFormat:@"%@",object];
    }
    // 判断是否为空串
    if ([object isEqual:[NSNull null]])
    {
        return YES;
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else if (object==nil)
    {
        return YES;
    }
    else if ([object isKindOfClass:[NSString class]])
    {
        if ([object isEqualToString:@"<null>"])
        {
            return YES;
        }
        else if ([object isEqualToString:@"null"])
        {
            return YES;
        }
        else if ([object isEqualToString:@"(null)"])
        {
            return YES;
        }
        else if ([object isEqualToString:@""])
        {
            return YES;
        }
    }
    return NO;
}

///获取当前网速--转成字符串
+ (NSString *)getCurrentByteRate
{
    long long intcurrentBytes = [self getInterfaceBytes];
    NSString *rateStr = [self formatNetWork:intcurrentBytes];
    return rateStr;
}

///获取当前网速
+ (long long) getInterfaceBytes
{
    struct ifaddrs *ifa_list = 0, *ifa;
    if (getifaddrs(&ifa_list) == -1) {
        return 0;
    }
    uint32_t iBytes = 0;
    uint32_t oBytes = 0;
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next) {
        if (AF_LINK != ifa->ifa_addr->sa_family)
            continue;
        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
            continue;
        if (ifa->ifa_data == 0)
            continue;
        /* Not a loopback device. */
        if (strncmp(ifa->ifa_name, "lo", 2)){
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            iBytes += if_data->ifi_ibytes;
            
            oBytes += if_data->ifi_obytes;
        }
    }
    freeifaddrs(ifa_list);
    NSLog(@"\n[getInterfaceBytes-Total]%d,%d",iBytes,oBytes);
    return iBytes + oBytes;
}

+ (NSString *)formatNetWork:(long long int)rate
{
    if (rate <1024) {
        return [NSString stringWithFormat:@"%lldB/秒", rate];
    } else if (rate >=1024&& rate <1024*1024) {
        return [NSString stringWithFormat:@"%.1fKB/秒", (double)rate /1024];
    } else if (rate >=1024*1024&& rate <1024*1024*1024) {
        return [NSString stringWithFormat:@"%.2fMB/秒", (double)rate / (1024*1024)];
    } else {
        return@"10Kb/秒";
    };
}

+ (void)openVIPWithCategoryOneId:(NSString *)categoryOneId successBlock:(void(^)())successBlock
{
    KDBuyModelOneVIPDto *dto = [[KDBuyModelOneVIPDto alloc] init];
    dto.categoryOneId = categoryOneId;
    [[KDPOSTManager manager] request:dto sucessBlock:^(KDOneVIPInforModel * responseObject) {
        if ([[KDUserDefaults shareUserDefaults].iOSTestUser integerValue] == 0)
        {
            [SVProgressHUD showWithStatus:@"正在加载中..."];
            [[KDInAppPurchaseTool shareInAppPurchase] requestProductWithProductIdentifier:responseObject.productId success:^(NSArray *products) {
                if (products.count == 0)
                {
                    [SVProgressHUD dismiss];
                    return;
                }
                [[KDInAppPurchaseTool shareInAppPurchase] paymentWithProduct:products.firstObject success:^(id result) {
                    if (successBlock)
                    {
                        successBlock();
                    }
                }];
            }];
        }
        else
        {
            KDPayView *payView = [[KDPayView alloc] init];
            __weak __typeof(payView) weakPayView = payView;
            KDVIPInforModel *productIdentifier = [KDVIPInforModel mj_objectWithKeyValues:responseObject.mj_keyValues];
            payView.productIdentifier = productIdentifier;
            payView.payBlock = ^(KDPayWayType type){
                if (type == KDPayWayType_ApplePay)
                {
                    [SVProgressHUD showWithStatus:@"正在加载中..."];
                    [[KDInAppPurchaseTool shareInAppPurchase] requestProductWithProductIdentifier:responseObject.productId success:^(NSArray *products) {
                        [[KDInAppPurchaseTool shareInAppPurchase] paymentWithProduct:products.firstObject success:^(id result) {
                            [weakPayView close];
                            if (successBlock)
                            {
                                successBlock();
                            }
                        }];
                    }];
                }
                else if (type == KDPayWayType_WeChat)
                {
                    [SVProgressHUD showWithStatus:@"正在加载中..."];
                    KDPayMembersDto *dto = [[KDPayMembersDto alloc] init];
                    dto.payType = @(2);
                    dto.membersLevelId = categoryOneId;
                    [[KDPOSTManager manager] request:dto sucessBlock:^(KDPayOrderDetailsResponse * responseObject) {
                        
                        if (responseObject.weChat)
                        {
                            [[WXApiManager sharedManager] WeChatPayWith:responseObject.weChat payCompletion:^(BaseResp *response) {
                                PayResp *resp = (PayResp *)response;
                                //支付返回结果，实际支付结果需要去微信服务器端查询
                                switch (resp.errCode)
                                {
                                    case WXSuccess://成功
                                    {
                                        [SVProgressHUD showSuccessWithStatus:@"微信支付成功"];
                                        [weakPayView close];
                                        if (successBlock)
                                        {
                                            successBlock();
                                        }
                                        break;
                                    }
                                    case WXErrCodeCommon://普通错误类型
                                    {
                                        [SVProgressHUD showErrorWithStatus:resp.errStr];
                                        [weakPayView close];
                                        break;
                                    }
                                    case WXErrCodeUserCancel://用户点击取消并返回
                                    {
                                        [SVProgressHUD showErrorWithStatus:@"您已经取消支付"];
                                        [weakPayView close];
                                        break;
                                    }
                                    case WXErrCodeSentFail://发送失败
                                    {
                                        [SVProgressHUD showErrorWithStatus:resp.errStr];
                                        [weakPayView close];
                                        break;
                                    }
                                    case WXErrCodeAuthDeny://授权失败
                                    {
                                        [SVProgressHUD showErrorWithStatus:resp.errStr];
                                        [weakPayView close];
                                        break;
                                    }
                                    case WXErrCodeUnsupport://授权微信不支持
                                    {
                                        [SVProgressHUD showErrorWithStatus:resp.errStr];
                                        [weakPayView close];
                                        break;
                                    }
                                    default:
                                        [SVProgressHUD showErrorWithStatus:@"微信支付失败,请稍后再试."];
                                        [weakPayView close];
                                        break;
                                }
                            }];
                        }
                        else
                        {
                            [SVProgressHUD showInfoWithStatus:@"微信支付失败"];
                        }
                    } failBlock:^(KDErrorResponse *error) {
                        [SVProgressHUD showErrorWithStatus:error.message];
                    }];
                }
                else
                {
                    [SVProgressHUD showWithStatus:@"正在加载中..."];
                    KDPayWebHyDto *dto = [[KDPayWebHyDto alloc] init];
                    dto.payId = responseObject.payId;
                    [[KDPOSTManager manager] request:dto sucessBlock:^(KDStrResponse * responseObject) {
                        [SVProgressHUD dismiss];
                        NSURL *url = [NSURL URLWithString:responseObject.str];
                        BOOL flag = [[UIApplication sharedApplication] canOpenURL:url];
                        if (flag)
                        {
                            [weakPayView close];
                            [[UIApplication sharedApplication] openURL:url];
                        }
                        [SVProgressHUD dismiss];
                    } failBlock:^(KDErrorResponse *error) {
                        [SVProgressHUD showErrorWithStatus:error.message];
                    }];
                }
            };
            [payView showInView:[QDTopViewControllerTools qd_topNavigationController].view];
        }
    } failBlock:^(KDErrorResponse *error) {
        [SVProgressHUD showErrorWithStatus:error.message];
    }];
}
@end
