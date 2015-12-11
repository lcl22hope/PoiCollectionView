//
//  ViewMoreCell.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/11.
//  Copyright © 2015年 lcl. All rights reserved.
//

#import "ViewMoreCell.h"
@interface ViewMoreCell()

@property (nonatomic, strong) UILabel* viewMore;

@end

@implementation ViewMoreCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.viewMore];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    [self.viewMore makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.centerX);
        make.centerY.equalTo(self.contentView.centerY);
        make.width.lessThanOrEqualTo(self.contentView.width);
        make.height.equalTo(@15);
    }];
}


-(UILabel *)viewMore{
    if (!_viewMore) {
        _viewMore = [UILabel new];
        _viewMore.text = @"VIEW MORE";
        _viewMore.font = [UIFont systemFontOfSize:10.f];
        _viewMore.textColor = [UIColor darkTextColor];
        _viewMore.textAlignment = NSTextAlignmentCenter;
    }
    return _viewMore;
}

@end
