//
//  UIViewController+KDEmptyDataSet.h
//  GYThinkingEducation
//
//  Created by 李康德 on 16/12/6.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

@interface UIViewController (KDEmptyDataSet)<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@end

@interface UIView (KDEmptyDataSet)<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@end
