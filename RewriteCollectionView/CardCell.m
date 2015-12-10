//
//  CardCell.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/10.
//  Copyright © 2015年 lcl. All rights reserved.
//


#import "CardCell.h"

#define kPaddingX 15.f
#define kPaddingY 10.f

@interface CardCell()

@property (nonatomic, strong) UILabel* desLabel;
@property (nonatomic, strong) UIImageView* tagIcon;

@end


@implementation CardCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.desLabel];
        [self.contentView addSubview:self.tagIcon];
        self.contentView.backgroundColor = [UIColor brownColor];
        self.contentView.layer.cornerRadius = 5;
        self.contentView.layer.masksToBounds= YES;
        MASAttachKeys(self.desLabel,self.tagIcon);
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.desLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.centerX);
        make.top.equalTo(self.contentView.top).offset(-kPaddingY);
        make.width.equalTo(self.contentView.width).offset(-kPaddingX*2);
        make.height.equalTo(@35);
    }];
    
    [self.tagIcon makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.desLabel.left);
        make.bottom.equalTo(self.contentView.bottom).offset(-10);
        make.size.equalTo(MASBoxValue(CGSizeMake(15, 15))); //equalTo diff with mas_equalTo
    }];

}

#pragma mark - setter & getter
-(UILabel *)desLabel{
    if (!_desLabel) {
        _desLabel = [UILabel new];
        _desLabel.text = @"BEST GRASSHOPER TACOS TOLOACHE";
        _desLabel.font = [UIFont systemFontOfSize:15.f];
        _desLabel.textColor = LSCOLOR_HEX(0xffffff);
        _desLabel.numberOfLines = 2;
    }
    return _desLabel;
}

-(UIImageView *)tagIcon{
    if (!_tagIcon) {
        _tagIcon = [UIImageView new];
        _tagIcon.contentMode = UIViewContentModeScaleAspectFit;
        _tagIcon.image = [UIImage imageNamed:@"palmtree"];
    }
    
    return _tagIcon;
}

@end
