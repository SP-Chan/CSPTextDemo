//
//  AVCaptureDevice+CheckCamera.m
//  Ewallet
//
//  Created by 李康德 on 16/11/3.
//  Copyright © 2016年 UCSMY. All rights reserved.
//

#import "AVCaptureDevice+CheckCamera.h"

@implementation AVCaptureDevice (CheckCamera)

/**
 *  检测手机摄像头有没有开
 */
+ (void) validateCameraAuthorizationStatusWithAuthorizedSucess:(authorizedSucessBlock)sucessBlock AuthorizedFail:(authorizedFailBlock)failBlock
{
    // 在iOS7 时，只有部分地区要求授权才能打开相机
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1)
    {
        NSString *mediaType = AVMediaTypeVideo;
        AVAuthorizationStatus authStatus = [self authorizationStatusForMediaType:mediaType];
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied)
        {
            if (failBlock)
            {
                failBlock();
            }
            return;
        }
        else
        {
            if (sucessBlock)
            {
                sucessBlock();
            }
        }
    }
    else
    {
        // iOS 8 后，全部都要授权
        AVAuthorizationStatus status = [self authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status)
        {
            case AVAuthorizationStatusNotDetermined:// 许可对话没有出现，发起授权许可
            {
                [self requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted)//第一次用户接受
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            if (sucessBlock)
                            {
                                sucessBlock();
                            }
                        });
                    }
                    else//用户拒绝
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            if (failBlock)
                            {
                                failBlock();
                            }
                        });
                    }
                }];
                break;
            }
            case AVAuthorizationStatusAuthorized:// 已经开启授权，可继续
            {
                if (sucessBlock)
                {
                    sucessBlock();
                }
                break;
            }
            case AVAuthorizationStatusDenied:
            case AVAuthorizationStatusRestricted:
            {
                // 用户明确地拒绝授权，或者相机设备无法访问
                if (failBlock)
                {
                    failBlock();
                }
                break;
            }
            default:
                break;
        }
    }
}

@end
