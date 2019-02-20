//
//  UIScreen+YTKit.m
//  Pods
//
//  Created by brant on 2017/12/18.
//

#import "UIScreen+YTKit.h"

@implementation UIScreen (YTKit)

+ (BOOL)yt_is3p5Inch {
    //Returns YES if the device is an iPhone 4
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO);
}

+ (BOOL)yt_is4Inch {
    //Returns YES if the device is an iPhone 6(Plus)
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO);
}

+ (BOOL)yt_is4p7Inch {
    //Returns YES if the device is an iPhone 6(Regular)
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO);
    
}

+ (BOOL)yt_is5p5Inch {
    //Returns YES if the device is an iPhone 6(Regular or Plus)
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO);
}

+ (BOOL)yt_isPlusEnlargeMode {
    //Returns YES if the device is an iPhone Plus EnlargeMode
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO);
}

+ (BOOL)yt_isIphoneX {
    //Returns YES if the device is an is IphoneX
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO);
}

+ (BOOL)yt_isIphoneXSMax {
    //Returns YES if the device is an is Iphone XS Max
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO);
}

+ (BOOL)yt_isIphoneXR {
    //Returns YES if the device is an is Iphone XR
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO);
}

+ (BOOL)yt_isIphoneXSeries {
    //Returns YES if the device is an is Iphone X(s) (R||Max)
    if ([UIScreen yt_isIphoneX] || [UIScreen yt_isIphoneXSMax] || [UIScreen yt_isIphoneXR]) {
        return YES;
    }
    return NO;
}

+ (BOOL)yt_isPad {
    //Returns YES if the device is an iPad iPhone应用在iPad上也以3.5寸屏幕的规格显示
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? [[UIDevice currentDevice].model hasPrefix:@"iPad"] : NO);
}

@end
