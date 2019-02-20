//
//  NSObject+VideoExtension.m
//  GYThinkingEducation
//
//  Created by brant on 2018/10/19.
//  Copyright © 2018 gaiying. All rights reserved.
//

#import "NSObject+VideoExtension.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@implementation NSObject (VideoExtension)
///获取视频指定区间的帧图片
+ (void)frameImageWithVideoUrl:(NSURL *)videoUrl startTime:(NSUInteger)startTime count:(NSUInteger)count completedBlock:(void(^)(NSArray *array))completedBlock
{
    if (!videoUrl)
    {
        return;
    }
    NSDictionary *optDict = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *avasset = [[AVURLAsset alloc] initWithURL:videoUrl options:optDict];
    NSMutableArray *times = [NSMutableArray array];
    CMTime timeFrame;
    
    ///总共截取16秒视频，5张图片
    for (NSInteger index = 0; index < count; index ++)
    {
        timeFrame = CMTimeMake((startTime + index * 3.2), 1); //第i帧  帧率
        NSValue *timeValue = [NSValue valueWithCMTime:timeFrame];
        [times addObject:timeValue];
    }
    
    AVAssetImageGenerator *imgGenerator = [[AVAssetImageGenerator alloc] initWithAsset:avasset];
    //防止时间出现偏差
    imgGenerator.requestedTimeToleranceBefore = kCMTimeZero;
    imgGenerator.requestedTimeToleranceAfter = kCMTimeZero;
    
    [SVProgressHUD show];
    NSMutableArray *arrayM = [NSMutableArray array];
    NSMutableArray *tempaM = [NSMutableArray array];
    [imgGenerator generateCGImagesAsynchronouslyForTimes:times completionHandler:^(CMTime requestedTime, CGImageRef  _Nullable image, CMTime actualTime, AVAssetImageGeneratorResult result, NSError * _Nullable error) {
        [tempaM addObject:@""];
        if (image && [[UIImage alloc] initWithCGImage:image])
        {
            UIImage *img = [self compressImageWithImage:[[UIImage alloc] initWithCGImage:image]];
            [arrayM addObject:img];
        }
        
        if (times.count == tempaM.count)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                if (completedBlock) {
                    completedBlock(arrayM.copy);
                }
            });
        }
    }];
}


//压缩图片
+ (UIImage*)compressImageWithImage:(UIImage*)image
{
    CGSize size = image.size;
    CGSize scaleSize = CGSizeMake(size.width * 0.2, size.height * 0.2);
    UIGraphicsBeginImageContext(scaleSize);
    [image drawInRect:CGRectMake(0,0,scaleSize.width,scaleSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 合成gif
 
 @param images         图片数组
 @param completedBlock 完成回调
 */
+ (void)composeGIFWithImgaes:(NSMutableArray *)images completedBlock:(void(^)(NSData *gifData))completedBlock
{
    //获取Document文件
    NSString * docsdir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //创建gif路径
    NSString * gifFilePath = [docsdir stringByAppendingPathComponent:@"GIF"];//将需要创建的串拼接到后面
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:gifFilePath isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) ) {//如果文件夹不存在
        [fileManager createDirectoryAtPath:gifFilePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSDate *date = [NSDate date];
    NSTimeInterval t = [date timeIntervalSince1970];
    
    NSString * gifPath = [gifFilePath stringByAppendingString:[NSString stringWithFormat:@"/%f.gif",t]];
    //图像目标
    CGImageDestinationRef destination;
    CFURLRef url=CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)gifPath, kCFURLPOSIXPathStyle, false);
    //通过一个url返回图像目标
    destination = CGImageDestinationCreateWithURL(url, kUTTypeGIF, images.count, NULL);
    //设置gif的信息,播放间隔时间,基本数据,和delay时间,可以自己设置
    NSDictionary *frameProperties = [NSDictionary
                                     dictionaryWithObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.1], (NSString *)kCGImagePropertyGIFDelayTime, nil]
                                     forKey:(NSString *)kCGImagePropertyGIFDictionary];
    
    //设置gif信息
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:2];
    
    //颜色
    [dict setObject:[NSNumber numberWithBool:YES] forKey:(NSString*)kCGImagePropertyGIFHasGlobalColorMap];
    
    //颜色类型
    [dict setObject:(NSString *)kCGImagePropertyColorModelRGB forKey:(NSString *)kCGImagePropertyColorModel];
    
    //颜色深度
    [dict setObject:[NSNumber numberWithInt:8] forKey:(NSString*)kCGImagePropertyDepth];
    
    //是否重复
    [dict setObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
    
    NSDictionary * gifproperty = [NSDictionary dictionaryWithObject:dict forKey:(NSString *)kCGImagePropertyGIFDictionary];
    
    //合成gif
    for (UIImage *image in images)
    {
        CGImageDestinationAddImage(destination, image.CGImage, (__bridge CFDictionaryRef)frameProperties);
    }
    
    CGImageDestinationSetProperties(destination, (__bridge CFDictionaryRef)gifproperty);
    bool flag = CGImageDestinationFinalize(destination);
    if (flag)
    {
        if (completedBlock)
        {
            completedBlock([NSData dataWithContentsOfFile:gifPath]);
        }
        
        NSArray *contents = [fileManager contentsOfDirectoryAtPath:gifFilePath error:NULL];
        NSEnumerator *e = [contents objectEnumerator];
        NSString *filename;
        while ((filename = [e nextObject]))
        {
            [fileManager removeItemAtPath:[gifFilePath stringByAppendingPathComponent:filename] error:NULL];
        }
    }
    CFRelease(destination);
}

#pragma mark -截取视频
/**
 @param URLString 视频的URL
 @param videoRange 截取视频的范围 location位开始的秒数 length为持续的时间;
 @param completeBlock 视频截取的回调
 */
+ (void)captureVideoAndVideoURLString:(NSString *)URLString range:(NSRange)videoRange complete:(void(^)(NSURL *outPutURL))completeBlock
{
    if (!URLString)
    {
        if (completeBlock)
        {
            completeBlock(nil);
        }
        return;
    }
    NSURL *videoUrl = [NSURL URLWithString:URLString];
    //AVURLAsset此类主要用于获取媒体信息，包括视频、声音等
    AVURLAsset* videoAsset = [[AVURLAsset alloc] initWithURL:videoUrl options:nil];
    
    //创建AVMutableComposition对象来添加视频音频资源的AVMutableCompositionTrack
    AVMutableComposition* mixComposition = [AVMutableComposition composition];
    
    //CMTimeRangeMake(start, duration),start起始时间，duration时长，都是CMTime类型
    //CMTimeMake(int64_t value, int32_t timescale)，返回CMTime，value视频的一个总帧数，timescale是指每秒视频播放的帧数，视频播放速率，（value / timescale）才是视频实际的秒数时长，timescale一般情况下不改变，截取视频长度通过改变value的值
    //CMTimeMakeWithSeconds(Float64 seconds, int32_t preferredTimeScale)，返回CMTime，seconds截取时长（单位秒），preferredTimeScale每秒帧数
    
    //开始位置startTime
    CMTime startTime = CMTimeMakeWithSeconds(videoRange.location, videoAsset.duration.timescale);
    //截取长度videoDuration
    CMTime videoDuration = CMTimeMakeWithSeconds(videoRange.length, videoAsset.duration.timescale);
    
    CMTimeRange videoTimeRange = CMTimeRangeMake(startTime, videoDuration);
    
    //视频采集compositionVideoTrack
    AVMutableCompositionTrack *compositionVideoTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
    
    // 避免数组越界 tracksWithMediaType 找不到对应的文件时候返回空数组
    //TimeRange截取的范围长度
    //ofTrack来源
    //atTime插放在视频的时间位置
    [compositionVideoTrack insertTimeRange:videoTimeRange ofTrack:([videoAsset tracksWithMediaType:AVMediaTypeVideo].count>0) ? [videoAsset tracksWithMediaType:AVMediaTypeVideo].firstObject : nil atTime:kCMTimeZero error:nil];
    
    //视频声音采集(也可不执行这段代码不采集视频音轨，合并后的视频文件将没有视频原来的声音)
    AVMutableCompositionTrack *compositionVoiceTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
    
    [compositionVoiceTrack insertTimeRange:videoTimeRange ofTrack:([videoAsset tracksWithMediaType:AVMediaTypeAudio].count>0)?[videoAsset tracksWithMediaType:AVMediaTypeAudio].firstObject:nil atTime:kCMTimeZero error:nil];
    
    //AVAssetExportSession用于合并文件，导出合并后文件，presetName文件的输出类型
    AVAssetExportSession *assetExportSession = [[AVAssetExportSession alloc] initWithAsset:mixComposition presetName:AVAssetExportPresetPassthrough];
    
    NSString *videoKey = [NSString stringWithFormat:@"%@_%zd_%zd",URLString,videoRange.location,videoRange.length].md5String;
    NSString *pathExtension = videoUrl.pathExtension;
    NSString *path = [NSString stringWithFormat:@"%@/%@.%@",WKVIDEO_CACACHE_FOLDER,videoKey,pathExtension];
    NSString *outputFilePath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    //混合后的视频输出路径
    NSURL *outPutURL = [NSURL fileURLWithPath:outputFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:outputFilePath])
    {
        if (completeBlock)
        {
            completeBlock(outPutURL);
        }
        return;
    }
    
    //输出视频格式 outputFileType:AVFileType
    NSString *outputFileType = AVFileTypeMPEG4;
    if ([pathExtension isEqualToString:@"m4a"])
    {
        outputFileType = AVFileTypeAppleM4A;
    }
    else if ([pathExtension isEqualToString:@"mov"] || [pathExtension isEqualToString:@"qt"])
    {
        outputFileType = AVFileTypeQuickTimeMovie;
    }
    else if ([pathExtension isEqualToString:@"caf"])
    {
        outputFileType = AVFileTypeCoreAudioFormat;
    }
    else if ([pathExtension isEqualToString:@"mp3"])
    {
        outputFileType = AVFileTypeMPEGLayer3;
    }
    else if ([pathExtension isEqualToString:@"m4v"])
    {
        outputFileType = AVFileTypeAppleM4V;
    }
    else if ([pathExtension isEqualToString:@"aif"] || [pathExtension isEqualToString:@"aiff"])
    {
        outputFileType = AVFileTypeAIFF;
    }
    
    assetExportSession.outputFileType = outputFileType;
    assetExportSession.outputURL = outPutURL;
    //输出文件是否网络优化
    assetExportSession.shouldOptimizeForNetworkUse = YES;
    [assetExportSession exportAsynchronouslyWithCompletionHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (assetExportSession.status)
            {
                case AVAssetExportSessionStatusCompleted:
                {
                    if (completeBlock)
                    {
                        completeBlock(outPutURL);
                    }
                }
                    break;
                default:
                {
                    if (completeBlock)
                    {
                        completeBlock(nil);
                    }
                }
                    break;
            }
        });
    }];
}

//获取视频封面  videoURL:视频网络地址
+ (UIImage*)thumbnailImageForVideo:(NSURL *)videoURL time:(CMTime)time
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *thumbImg = [[UIImage alloc] initWithCGImage:image];
    return thumbImg;
}
@end
