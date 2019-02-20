//
//  UIImage+QRCode.m
//  GYThinkingEducation
//
//  Created by likangde on 16/11/21.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import "UIImage+QRCode.h"

@implementation UIImage (QRCode)

+(UIImage *)QRCodeWithInputMessage:(NSString *)inputMessage
{
    // 创建对应二维码功能的滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
//    二维码容错率
//    inputCorrectionLevel 是一个单字母（@"L", @"M", @"Q", @"H" 中的一个），表示不同级别的容错率，默认为 @"M".
//    QR码有容错能力，QR码图形如果有破损，仍然可以被机器读取内容，最高可以到7%~30%面积破损仍可被读取,相对而言，容错率愈高，QR码图形面积愈大。所以一般折衷使用15%容错能力。
//    L水平 7%的字码可被修正.
//    M水平 15%的字码可被修正
//    Q水平 25%的字码可被修正
//    H水平 30%的字码可被修正
//    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    NSData *data = [inputMessage dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    // 导出CIImage图片
    CIImage *ciImage = [filter outputImage];
    // 放大图片, 10倍
    CGAffineTransform scale = CGAffineTransformMakeScale(10, 10);
    CIImage *transformImage = [ciImage imageByApplyingTransform:scale];
    UIImage *originalImage = [UIImage imageWithCIImage:transformImage];
    return originalImage;
}

+ (UIImage *)QRCodeImageWithImage:(UIImage *)image
{
    NSURL *url = [NSURL URLWithString:[KDUserDefaults shareUserDefaults].headImgUrl];
    NSString *strUrl = [[SDWebImageManager sharedManager] cacheKeyForURL:url];
    UIImage *centerImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:strUrl];
    if (!centerImage)
    {
        centerImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    }
    if (!centerImage)
    {
        centerImage = [UIImage imageNamed:@"userIconDefault"];
    }
    
//    __block UIImage *centerImage = nil;
//    [[SDWebImageManager sharedManager] diskImageExistsForURL:url completion:^(BOOL isInCache) {
//        if (isInCache)
//        {
//            NSString *strUrl = [[SDWebImageManager sharedManager] cacheKeyForURL:url];
//            centerImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:strUrl];
//        }
//        else
//        {
//            centerImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
//        }
//    }];
    
//    if (!centerImage)
//    {
//        centerImage = [UIImage imageNamed:@"userIconDefault"];
//    }
    
    // 画图, 在中间再一个头像
    CGSize size = image.size;
    // 1. 开启图形上下文
    UIGraphicsBeginImageContext(size);
    // 2. 画原图
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 3. 画头像, 画在中单, 大小%20
    CGFloat wh = size.width * 0.25;  // 大概是30%
    [centerImage drawInRect:CGRectMake((size.width - wh) / 2, (size.height - wh) / 2, wh, wh)];
    // 4. 取出图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    // 5. 关闭上下文
    UIGraphicsEndImageContext();
    
    return resultImage;
}

@end
