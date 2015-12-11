//
//  PoiBriefTableView.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/10.
//  Copyright © 2015年 lcl. All rights reserved.
//

#import "PoiBriefTableView.h"
#import "PoiBriefHeader.h"
#import "PoiBriefSectionView.m"
#import "CardCell.h"
#import "ViewMoreCell.h"

static NSString* const cardCellId = @"CardCellId";
static NSString* const poiSectionViewId = @"poiSectionViewId";
static NSString* const viewMoreCellId = @"viewMoreCellId";

@interface PoiBriefTableView()<UITableViewDelegate,UITableViewDataSource>

@end


@implementation PoiBriefTableView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        [self registerClass:[PoiBriefSectionView class] forHeaderFooterViewReuseIdentifier:poiSectionViewId];
        [self registerClass:[CardCell class] forCellReuseIdentifier:cardCellId];
        [self registerClass:[ViewMoreCell class] forHeaderFooterViewReuseIdentifier:viewMoreCellId];
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds= YES;
        
    }
    return self;
}


-(NSInteger)numberOfSections{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.isUnfold) {
        return 3;
    }else{
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isUnfold) {
        if (indexPath.row<=1) {
            CardCell* cardCell = [tableView dequeueReusableCellWithIdentifier:cardCellId forIndexPath:indexPath];
            return cardCell;
        }else{
            ViewMoreCell* viewMoreCell = [tableView dequeueReusableCellWithIdentifier:viewMoreCellId forIndexPath:indexPath];
            return viewMoreCell;
        }
    }else{
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isUnfold) {
        if (indexPath.row<=1) {
            return 95;
        }else{
            return 40;
        }
    }else{
        return 0;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isUnfold) {
        cell.contentView.alpha = 0.0;
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath{
    if (self.isUnfold) {
        cell.contentView.alpha = 1.0;

    }
}



@end
