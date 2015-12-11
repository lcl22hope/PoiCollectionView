//
//  UIView+LushuView.h
//  Pieceful_iOS
//
//  Created by lcl on 15/7/30.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (LushuView)

@property (nonatomic) CGFloat cleft;
@property (nonatomic) CGFloat ctop;
@property (nonatomic) CGFloat cright;
@property (nonatomic) CGFloat cbottom;
@property (nonatomic) CGFloat cwidth;
@property (nonatomic) CGFloat cheight;
@property (nonatomic) CGFloat ccenterX;
@property (nonatomic) CGFloat ccenterY;
@property (nonatomic) CGPoint corigin;
@property (nonatomic) CGSize  csize;

@property (nonatomic, readonly) CGFloat cscreenX;
@property (nonatomic, readonly) CGFloat cscreenY;
@property (nonatomic, readonly) CGFloat cscreenViewX;
@property (nonatomic, readonly) CGFloat cscreenViewY;
@property (nonatomic, readonly) CGRect  cscreenFrame;

- (void) addSubviewResize: (UIView*)view;
- (void) removeAllSubviews;
- (void) didCornerRadius: (CGFloat)radius;

+(id)autolayoutView;

@end
