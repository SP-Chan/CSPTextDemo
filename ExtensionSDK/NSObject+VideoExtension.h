//
//  NSObject+VideoExtension.h
//  GYThinkingEducation
//
//  Created by brant on 2018/10/19.
//  Copyright © 2018 gaiying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (VideoExtension)
/**
 *  获取视频指定区间的帧图片
 *
 *  @param videoUrl       本地视频文件URL
 *  @param startTime      开始时间
 *  @param count          帧图片的张数
 *  @param completedBlock 所有帧被拆完成后回调
 */
+ (void)frameImageWithVideoUrl:(NSURL *)videoUrl startTime:(NSUInteger)startTime count:(NSUInteger)count completedBlock:(void(^)(NSArray *array))completedBlock;
/**
 合成gif
 @param images         图片数组
 @param completedBlock 完成回调
 */
+ (void)composeGIFWithImgaes:(NSMutableArray *)images completedBlock:(void(^)(NSData *gifData))completedBlock;

/**
 @param URLString 视频的URL
 @param videoRange 截取视频的范围 location位开始的秒数 length为持续的时间;
 @param completeBlock 视频截取的回调
 */
+ (void)captureVideoAndVideoURLString:(NSString *)URLString range:(NSRange)videoRange complete:(void(^)(NSURL *outPutURL))completeBlock;

//获取视频封面  videoURL:视频网络地址
+ (UIImage*)thumbnailImageForVideo:(NSURL *)videoURL time:(CMTime)time;
@end
