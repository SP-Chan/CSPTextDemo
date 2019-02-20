//
//  UIButton+Extension.m
//  GYThinkingEducation
//
//  Created by 李康德 on 16/11/19.
//  Copyright © 2016年 gaiying. All rights reserved.
//

#import "UIButton+Extension.h"

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

@implementation UIButton (Extension)

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor font:(UIFont *)font target:(nullable id)target action:(SEL)action
{
    if (self = [self initWithFrame:frame title:title titleColor:titleColor font:font target:target action:action])
    {
        self.backgroundColor = backgroundColor;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(nullable id)target action:(SEL)action
{
    if (self = [self initWithFrame:frame titleColor:titleColor font:font target:target action:action])
    {
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame titleColor:(UIColor *)titleColor font:(UIFont *)font target:(nullable id)target action:(SEL)action
{
    if (self = [super initWithFrame:frame])
    {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = font;
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(nullable id)target action:(SEL)action imageName:(NSString *)imageName
{
    if (self = [self initWithFrame:frame title:title titleColor:titleColor font:font target:target action:action])
    {
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(nullable id)target action:(SEL)action backgroundImageName:(NSString *)backgroundImageName
{
    if (self = [self initWithFrame:frame title:title titleColor:titleColor font:font target:target action:action])
    {
        [self setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName
{
    if (self = [super initWithFrame:frame])
    {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = font;
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundImageName:(NSString *)backgroundImageName
{
    if (self = [super initWithFrame:frame])
    {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = font;
        [self setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor
{
    if (self = [super initWithFrame:frame])
    {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = font;
        self.backgroundColor = backgroundColor;
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame backgroundImageName:(NSString *)backgroundImageName target:(nullable id)target action:(nullable SEL)action
{
    if (self = [super initWithFrame:frame])
    {
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [self setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    }
    return self;
}

/*** 背景小照片*/
-(nullable instancetype)initWithFrame:(CGRect)frame imageName:(nullable NSString *)imageName target:(nullable id)target action:(nullable SEL)action
{
    if (self = [super initWithFrame:frame])
    {
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return self;
}

-(nullable instancetype)initWithFrame:(CGRect)frame imageName:(nullable NSString *)imageName
{
    if (self = [super initWithFrame:frame])
    {
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return self;
}

-(void)circleButton
{
    [self circleButtonWithBorderWidth:0 borderColor:nil];
}

-(void)circleButtonWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    [self layoutIfNeeded];
    self.layer.cornerRadius = self.frame.size.height * 0.5;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}


- (void)show {
    
    if (!self.hidden) return;
    
    self.hidden = NO;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:2.0];
    scaleAnimation.toValue   = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration  = .3;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue  = [NSNumber numberWithFloat:.5];
    opacityAnimation.toValue    = [NSNumber numberWithFloat:1];
    opacityAnimation.duration   = .3;
    
    [self.layer addAnimation:scaleAnimation forKey:@"scale"];
    [self.layer addAnimation:opacityAnimation forKey:@"opacity"];
}

- (void)hide {
    self.hidden = YES;
}

/**
 设置图片与标题的位置样式及图片与标题的间距
 
 @param style 图片与标题的位置样式
 @param space 图片与标题的间距
 */
- (void)yt_layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space
{
    
    // button上imageView的宽度
    CGFloat imageViewWidth = CGRectGetWidth(self.imageView.frame);
    // button上label的宽度
    CGFloat labelWidth = CGRectGetWidth(self.titleLabel.frame);
    
    if (labelWidth == 0) {
        CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        labelWidth  = titleSize.width;
    }
    
    CGFloat imageInsetsTop = 0.0f;
    CGFloat imageInsetsLeft = 0.0f;
    
    CGFloat titleInsetsTop = 0.0f;
    CGFloat titleInsetsLeft = 0.0f;
    
    switch (style) {
        case ButtonEdgeInsetsStyleImageRight: {
            // 图片在右
            space = space * 0.5;
            
            imageInsetsLeft = labelWidth + space;
            
            titleInsetsLeft = - (imageViewWidth + space);
        }
            break;
            
        case ButtonEdgeInsetsStyleImageLeft:
        {
            space = space * 0.5;
            
            imageInsetsLeft = -space;
            
            titleInsetsLeft = space;
        }
            break;
        case ButtonEdgeInsetsStyleImageBottom:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;
            
            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);
            
            CGFloat imageBottomY = CGRectGetMaxY(self.imageView.frame);
            CGFloat titleTopY = CGRectGetMinY(self.titleLabel.frame);
            
            imageInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - imageBottomY;
            imageInsetsLeft = centerX_button - centerX_image;
            
            titleInsetsTop = (buttonHeight * 0.5 - boundsCentery) - titleTopY;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            
        }
            break;
        case ButtonEdgeInsetsStyleImageTop:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;
            
            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);
            
            CGFloat imageTopY = CGRectGetMinY(self.imageView.frame);
            CGFloat titleBottom = CGRectGetMaxY(self.titleLabel.frame);
            
            imageInsetsTop = (buttonHeight * 0.5 - boundsCentery) - imageTopY;
            imageInsetsLeft = centerX_button - centerX_image;
            
            titleInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - titleBottom;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            
        }
            break;
            
        default:
            break;
    }
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageInsetsTop, imageInsetsLeft, -imageInsetsTop, -imageInsetsLeft);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleInsetsTop, titleInsetsLeft, -titleInsetsTop, -titleInsetsLeft);
}

- (void)kd_setEnlargeEdge:(CGFloat)size
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)kd_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}










@end
