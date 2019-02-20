//
//  HMSegmentedControl+WKSegmentedStyle.m
//  GYThinkingEducation
//
//  Created by 微课传奇001 on 2019/1/10.
//  Copyright © 2019 gaiying. All rights reserved.
//

#import "HMSegmentedControl+WKSegmentedStyle.h"
/**
 根据主题样式设置HMSegementControl
 */
@implementation HMSegmentedControl (WKSegmentedStyle)

- (void)wk_configClearBackgroundStyle {
    self.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, -5.0, 0);
    self.backgroundColor = [UIColor clearColor];
    self.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    
    self.selectionIndicatorColor = [UIColor colorWithHexString:@"ffc105"];
    self.selectionIndicatorHeight = 2.0;
    self.titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithHexString:@"aaaaaa"],
                                 NSFontAttributeName : TP_GLOBAL_BODY_FONT_SIZE(14.0f)};
    self.selectedTitleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithHexString:@"ffc105"],
                                         NSFontAttributeName : TP_GLOBAL_BODY_FONT_SIZE(14.0f)};
//    self.borderColor = [UIColor colorWithHexString:@"f4f4f4"];
}

@end
