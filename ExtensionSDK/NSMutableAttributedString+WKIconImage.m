//
//  NSMutableAttributedString+WKIconImage.m
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/11.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import "NSMutableAttributedString+WKIconImage.h"

@implementation NSMutableAttributedString (WKIconImage)
//player_videoList_vip
- (void)tp_appendVIPImage56_36 {
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = [UIImage imageNamed:@"player_videoList_vip"];
    NSMutableAttributedString *imageAttributeString = [[NSAttributedString attributedStringWithAttachment:imageAttachment] mutableCopy];
    [imageAttributeString addAttributes:@{NSBaselineOffsetAttributeName:@-3} range:NSMakeRange(0, imageAttributeString.length)];
    [self appendAttributedString:imageAttributeString];
}

- (void)tp_appendVIPGrayImage52_28 {
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = [UIImage imageNamed:@"player_gray_vip"];
    NSMutableAttributedString *imageAttributeString = [[NSAttributedString attributedStringWithAttachment:imageAttachment] mutableCopy];
    [imageAttributeString addAttributes:@{NSBaselineOffsetAttributeName:@-2} range:NSMakeRange(0, imageAttributeString.length)];
    [self appendAttributedString:imageAttributeString];
}

//mine_daily_video_detail
- (void)tp_appendVideoDetailImage12_18 {
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = [UIImage imageNamed:@"mine_daily_video_detail"];
    NSMutableAttributedString *imageAttributeString = [[NSAttributedString attributedStringWithAttachment:imageAttachment] mutableCopy];
    [imageAttributeString addAttributes:@{NSBaselineOffsetAttributeName:@-2} range:NSMakeRange(0, imageAttributeString.length)];
    [self appendAttributedString:imageAttributeString];
}

//myCenter_VIP_tag
- (void)tp_appendVIPTag16_8 {
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = [UIImage imageNamed:@"myCenter_VIP_tag"];
    NSMutableAttributedString *imageAttributeString = [[NSAttributedString attributedStringWithAttachment:imageAttachment] mutableCopy];
    [imageAttributeString addAttributes:@{NSBaselineOffsetAttributeName:@-1} range:NSMakeRange(0, imageAttributeString.length)];
    [self appendAttributedString:imageAttributeString];
}

//wk_comment_text_top
- (void)tp_appendCommentTextTop78_34 {
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = [UIImage imageNamed:@"wk_comment_text_top"];
    NSMutableAttributedString *imageAttributeString = [[NSAttributedString attributedStringWithAttachment:imageAttachment] mutableCopy];
    [imageAttributeString addAttributes:@{NSBaselineOffsetAttributeName:@-3} range:NSMakeRange(0, imageAttributeString.length)];
    [self appendAttributedString:imageAttributeString];
}

@end
