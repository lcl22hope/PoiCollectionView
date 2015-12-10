//
//  PoiBriefSectionView.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/10.
//  Copyright © 2015年 lcl. All rights reserved.
//

#import "PoiBriefSectionView.h"

@interface PoiBriefSectionView(){
    UIEdgeInsets inset;
}

@property (nonatomic, strong) UILabel* brief;

@end

@implementation PoiBriefSectionView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.brief];
        self.contentView.backgroundColor = [UIColor whiteColor];
        inset = UIEdgeInsetsMake(15.f, 15.f, 15.f, 15.f);
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.brief makeConstraints:^(MASConstraintMaker *make) {
        //
    }];
}

-(UILabel *)brief{
    if (!_brief) {
        _brief = [UILabel new];
        _brief.text = @"Times Square is one of the world's visited tourist attractions,\
                        drawing an estimated fifty million vistors annually";
        _brief.textColor = [UIColor darkTextColor];
        _brief.font = [UIFont systemFontOfSize:11.f];
        _brief.numberOfLines = 2;
    }
    return _brief;
}

@end
