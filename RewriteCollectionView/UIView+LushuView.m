//
//  UIView+LushuView.m
//  Pieceful_iOS
//
//  Created by lcl on 15/7/30.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "UIView+LushuView.h"

@implementation UIView (LushuView)

- (CGFloat)cleft {
    return self.frame.origin.x;
}

- (void)setCleft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)ctop {
    return self.frame.origin.y;
}

- (void)setCtop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)cright {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setCright:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)cbottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setCbottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)cwidth {
    return self.frame.size.width;
}

- (void)setCwidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)cheight {
    return self.frame.size.height;
}

- (void)setCheight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)ccenterX {
    return self.center.x;
}

- (void)setCcenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)ccenterY {
    return self.center.y;
}

- (void)setCcenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)corigin {
    return self.frame.origin;
}

- (void)setCorigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)csize {
    return self.frame.size;
}

- (void)setCsize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)cscreenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.cleft;
    }
    return x;
}

- (CGFloat)cscreenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.ctop;
    }
    return y;
}

- (CGFloat)cscreenViewX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.cleft;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

- (CGFloat)cscreenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.ctop;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)cscreenFrame {
    return CGRectMake(self.cscreenViewX, self.cscreenViewY, self.cwidth, self.cheight);
}

- (void)addSubviewResize: (UIView*)view {
    if(view) {
        [self addSubview: view];
        self.cwidth=MAX(self.cwidth, view.cright);
        self.cheight=MAX(self.cheight, view.cbottom);
    }
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (void)didCornerRadius: (CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 1.0;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 1.0);
}

+(id)autolayoutView
{
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}


@end
