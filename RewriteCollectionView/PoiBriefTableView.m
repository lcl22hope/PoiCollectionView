//
//  PoiBriefTableView.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/10.
//  Copyright © 2015年 lcl. All rights reserved.
//

#import "PoiBriefTableView.h"
#import "CardCell.h"

static NSString* const cardCellId = @"CardCellId";

@implementation PoiBriefTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        [self registerClass:[CardCell class] forCellReuseIdentifier:cardCellId];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
