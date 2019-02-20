//
//  UIColor+HexColors.h
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2018/11/15.
//  Copyright © 2018 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum { TPR, TPG, TPB, TPA } UIColorComponentIndices;

@interface UIColor (HexColors)

- (CGFloat)getColorBy:(UIColorComponentIndices)index;

+(UIColor *)colorWithHexString:(NSString *)hexString;
+(NSString *)hexValuesFromUIColor:(UIColor *)color;
+(UIColor *)colorWithHexString:(NSString *)hexString alph:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
