//
//  PoiBriefSectionView.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/10.
//  Copyright © 2015年 lcl. All rights reserved.
//

#import "PoiBriefSectionView.h"



@interface PoiBriefSectionView ()

@property(nonatomic, strong) UILabel *label;
@property(nonatomic, assign) UIEdgeInsets sectionInset;

@end

@implementation PoiBriefSectionView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.label];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.sectionInset = UIEdgeInsetsMake(15.f, 15.f, 15.f, 15.f);
        
        MASAttachKeys(self.label);
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    if (!_isUnfold) {
        UIBezierPath* roundPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                        byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight
                                                              cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *shape = [[CAShapeLayer alloc] init];
        shape.backgroundColor = [UIColor clearColor].CGColor;
        [shape setFrame:rect];
        [shape setPath:roundPath.CGPath];
        
        self.layer.masksToBounds = YES;
        self.layer.mask = shape;
        shape.frame = self.layer.bounds;
    }else{
        UIBezierPath* roundPath = [UIBezierPath bezierPathWithRect:rect];
        CAShapeLayer *shape = [[CAShapeLayer alloc] init];
        shape.backgroundColor = [UIColor clearColor].CGColor;
        [shape setFrame:rect];
        [shape setPath:roundPath.CGPath];
        
        self.layer.masksToBounds = YES;
        self.layer.mask = shape;
        shape.frame = self.layer.bounds;
    }
    
}

- (void)layoutSubviews {
  [super layoutSubviews];

  [self.label makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.contentView.centerX);
    make.centerY.equalTo(self.contentView.centerY);
    make.width.equalTo(@(SCREEN_WIDTH-20-30));
    make.height.equalTo(@28);
  }];
}

- (UILabel *)label {
  if (!_label) {
    _label = [UILabel new];
    _label.text = @"Times Square is one of the world's visited tourist attractions,drawing an estimated fifty million vistors annually";
    _label.textColor = [UIColor darkTextColor];
    _label.font = [UIFont systemFontOfSize:11.f];
    _label.numberOfLines = 2;
  }
  return _label;
}

@end
