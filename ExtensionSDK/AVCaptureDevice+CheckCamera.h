//
//  AVCaptureDevice+CheckCamera.h
//  Ewallet
//
//  Created by 李康德 on 16/11/3.
//  Copyright © 2016年 UCSMY. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
typedef void(^authorizedSucessBlock)();
typedef void(^authorizedFailBlock)();


@interface AVCaptureDevice (CheckCamera)
/**
 *  检测手机摄像头有没有开
 */
+ (void) validateCameraAuthorizationStatusWithAuthorizedSucess:(authorizedSucessBlock)sucessBlock AuthorizedFail:(authorizedFailBlock)failBlock;

@end
