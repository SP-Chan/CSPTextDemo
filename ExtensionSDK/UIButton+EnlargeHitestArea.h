//
//  UIButton+EnlargeHitestArea.h
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2018/11/10.
//  Copyright © 2018 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (EnlargeHitestArea)

/**
 负值 eg: UIEdgeInsetsMake(-15, -10, -15, -10);
 */
@property(nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;

@end

NS_ASSUME_NONNULL_END
