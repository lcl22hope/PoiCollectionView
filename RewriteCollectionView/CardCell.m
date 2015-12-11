//
//  CardCell.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/10.
//  Copyright © 2015年 lcl. All rights reserved.
//

#import "CardCell.h"
#import "common.h"
#import <Masonry/Masonry.h>

#define kPaddingX 15.f
#define kPaddingY 10.f

@interface CardCell () {
  UIEdgeInsets inset;
}

@property(nonatomic, strong) UILabel *desLabel;
@property(nonatomic, strong) UIImageView *tagIcon;
@property(nonatomic, strong) UIImageView *bgImg;

@end

@implementation CardCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.contentView.backgroundColor = [UIColor whiteColor];

        [self.contentView addSubview:self.bgImg];
        [self.contentView addSubview:self.desLabel];
        [self.contentView addSubview:self.tagIcon];
        inset = UIEdgeInsetsMake(5.f, 15.f, 5.f, 15.f);
        MASAttachKeys(self.bgImg, self.desLabel, self.tagIcon);
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  [self.bgImg makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.contentView.centerX);
    make.centerY.equalTo(self.contentView.centerY);
    make.width.equalTo(self.contentView.width)
        .offset(-(inset.left + inset.right));
    make.height.equalTo(self.contentView.height)
        .offset(-(inset.top + inset.bottom));
  }];

  self.bgImg.layer.cornerRadius = 5;
  self.bgImg.layer.masksToBounds = YES;

  [self.desLabel makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.bgImg.centerX);
    make.top.equalTo(self.bgImg.top).offset(kPaddingY);
    make.width.equalTo(self.bgImg.width).offset(-kPaddingX * 2);
    make.height.equalTo(@35);
  }];

  [self.tagIcon makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.desLabel.left);
    make.bottom.equalTo(self.bgImg.bottom).offset(-10);
    make.size.equalTo(
        MASBoxValue(CGSizeMake(15, 15))); // equalTo diff with mas_equalTo
  }];
}

#pragma mark - setter & getter
- (UILabel *)desLabel {
  if (!_desLabel) {
    _desLabel = [UILabel new];
    _desLabel.text = @"BEST GRASSHOPER TACOS TOLOACHE";
    _desLabel.font = [UIFont systemFontOfSize:15.f];
    _desLabel.textColor = LSCOLOR_HEX(0xffffff);
    _desLabel.numberOfLines = 2;
  }
  return _desLabel;
}

- (UIImageView *)tagIcon {
  if (!_tagIcon) {
    _tagIcon = [UIImageView new];
    _tagIcon.contentMode = UIViewContentModeScaleAspectFit;
    _tagIcon.image = [UIImage imageNamed:@"palmtree"];
  }

  return _tagIcon;
}

- (UIImageView *)bgImg {
  if (!_bgImg) {
    _bgImg = [UIImageView new];
    _bgImg.backgroundColor = [UIColor greenColor];
  }
  return _bgImg;
}

@end
