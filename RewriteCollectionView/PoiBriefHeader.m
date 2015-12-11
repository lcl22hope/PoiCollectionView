//
//  PoiBriefHeader.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/10.
//  Copyright © 2015年 lcl. All rights reserved.
//

#import "PoiBriefHeader.h"
#import "common.h"
#import <Masonry/Masonry.h>

@interface PoiBriefHeader () {
  UIEdgeInsets inset;
}

@property(nonatomic, strong) UIImageView *tagIcon;
@property(nonatomic, strong) UIButton *tilteBtn;
@property(nonatomic, strong) UIButton *goBtn;
@property(nonatomic, strong) UIImageView *line;

@end

@implementation PoiBriefHeader

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
      self.backgroundColor = LSCOLOR_HEX(0xffffff);
      [self addSubview:self.tagIcon];
      [self addSubview:self.tilteBtn];
      [self addSubview:self.goBtn];
      [self addSubview:self.line];
      inset = UIEdgeInsetsMake(15.f, 15.f, 15.f, 15.f);
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  UIBezierPath *roundPath = [UIBezierPath
      bezierPathWithRoundedRect:rect
              byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                    cornerRadii:CGSizeMake(5, 5)];
  CAShapeLayer *shape = [[CAShapeLayer alloc] init];
  shape.backgroundColor = [UIColor clearColor].CGColor;
  [shape setFrame:rect];
  [shape setPath:roundPath.CGPath];

  self.layer.masksToBounds = YES;
  self.layer.mask = shape;
  shape.frame = self.layer.bounds;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  [self.tagIcon makeConstraints:^(MASConstraintMaker *make) {
    make.centerY.equalTo(self.centerY);
    make.left.equalTo(self.left).offset(inset.left);
    make.width.equalTo(@15);
    make.height.equalTo(@16);
  }];

  [self.tilteBtn makeConstraints:^(MASConstraintMaker *make) {
    make.centerY.equalTo(self.centerY);
    make.left.equalTo(self.tagIcon.right).offset(4.f);
    make.width.lessThanOrEqualTo(self.width).offset(-60);
    make.height.equalTo(@20);
  }];

  [self.goBtn makeConstraints:^(MASConstraintMaker *make) {
    make.centerY.equalTo(self.centerY);
    make.right.equalTo(self.right).offset(-inset.right);
    make.width.equalTo(@16);
    make.height.equalTo(@16);
  }];

  [self.line makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.equalTo(self.bottom).offset(-1);
    make.left.equalTo(self.left).offset(inset.left);
    make.width.equalTo(self.width).offset(-(inset.left + inset.right));
    make.height.equalTo(@1);
  }];
}

#pragma mark - getter & setter

- (UIImageView *)tagIcon {
  if (!_tagIcon) {
    _tagIcon = [UIImageView new];
    _tagIcon.image = [UIImage imageNamed:@"passport"];
    _tagIcon.contentMode = UIViewContentModeScaleAspectFit;
  }
  return _tagIcon;
}

- (UIButton *)tilteBtn {
  if (!_tilteBtn) {
      _tilteBtn = [UIButton new];
      [_tilteBtn setTitle:@"TIME SQUARE" forState:UIControlStateNormal];
      [_tilteBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
      _tilteBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
      _tilteBtn.titleLabel.font = [UIFont systemFontOfSize:16.f];
      _tilteBtn.titleLabel.textColor = [UIColor darkTextColor];
  }
  return _tilteBtn;
}

- (UIButton *)goBtn {
  if (!_goBtn) {
    _goBtn = [UIButton new];
    [_goBtn setImage:[UIImage imageNamed:@"go"] forState:UIControlStateNormal];
    _goBtn.contentMode = UIViewContentModeScaleAspectFit;
  }
  return _goBtn;
}

- (UIImageView *)line {
  if (!_line) {
    _line = [UIImageView new];
    _line.backgroundColor = [UIColor darkTextColor];
  }
  return _line;
}

@end
