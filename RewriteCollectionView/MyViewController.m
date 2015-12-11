//
//  MyViewController.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/11.
//  Copyright © 2015年 lcl. All rights reserved.
//

#import "CardCell.h"
#import "MyViewController.h"
#import "PoiBriefHeader.h"
#import "PoiBriefSectionView.h"
#import "PoiBriefTableView.h"
#import "ViewMoreCell.h"
#import "common.h"
#import <Masonry/Masonry.h>

static NSString *cardCellId = @"CardCellId";
static NSString *poiSectionViewId = @"poiSectionViewId";
static NSString *viewMoreCellId = @"viewMoreCellId";

@interface MyViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) PoiBriefTableView *poiBriefTView;
@property (nonatomic, strong) PoiBriefHeader *poiBriefHeader;
@property (nonatomic, strong) UIButton* unfoldBtn;

@property (nonatomic, strong) UIPanGestureRecognizer* panGesture;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeUp, *swipeDown;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.unfoldBtn];
    
    [self.unfoldBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(50);
        make.centerX.equalTo(self.view.centerX);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
    }];
    
    [self.view addSubview:self.poiBriefTView];
    
    self.poiBriefTView.tableHeaderView = self.poiBriefHeader;
    [self.poiBriefTView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


-(void)unfoldTap:(id)sender{
    BOOL isUnfold = !self.poiBriefTView.isUnfold;
    self.poiBriefTView.isUnfold = isUnfold;
    
    if (isUnfold) {
        self.poiBriefTView.cheight = (48+55+95*2+40);
        self.poiBriefTView.ctop -= (95*2 + 40);
        [self.poiBriefTView beginUpdates];
        
        [self.poiBriefTView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.poiBriefTView endUpdates];
    }else{
        self.poiBriefTView.cheight = 105;
        self.poiBriefTView.ctop += (95*2 + 40);
        [self.poiBriefTView reloadData];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.poiBriefTView.isUnfold) {
        return 3;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.poiBriefTView.isUnfold) {
        if (indexPath.row <= 1) {
            CardCell *cardCell =
            [tableView dequeueReusableCellWithIdentifier:cardCellId
                                            forIndexPath:indexPath];
        return cardCell;
    } else {
        ViewMoreCell *viewMoreCell = [tableView dequeueReusableCellWithIdentifier:viewMoreCellId
                                                                     forIndexPath:indexPath];
      return viewMoreCell;
    }
  } else {
    return nil;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.poiBriefTView.isUnfold) {
        if (indexPath.row <= 1) {
            return 95;
    }else{
        return 40;
    }
  }else{
    return 0;
  }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.poiBriefTView.isUnfold) {
//        cell.contentView.alpha = 0.0;
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.poiBriefTView.isUnfold) {
//        cell.contentView.alpha = 1.0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    PoiBriefSectionView *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:poiSectionViewId];
    if (!sectionView) {
        sectionView = [[PoiBriefSectionView alloc] initWithReuseIdentifier:poiSectionViewId];
    }
    sectionView.isUnfold = self.poiBriefTView.isUnfold;
    sectionView
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 55.f;
}

- (PoiBriefTableView *)poiBriefTView {
    if (!_poiBriefTView) {
        _poiBriefTView = [[PoiBriefTableView alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT-10-105, SCREEN_WIDTH - 20, 105) style:UITableViewStylePlain];
        _poiBriefTView.bounces = NO;
        [_poiBriefTView registerClass:[PoiBriefSectionView class] forHeaderFooterViewReuseIdentifier:poiSectionViewId];
        [_poiBriefTView registerClass:[CardCell class] forCellReuseIdentifier:cardCellId];
        [_poiBriefTView registerClass:[ViewMoreCell class] forCellReuseIdentifier:viewMoreCellId];
        _poiBriefTView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _poiBriefTView.backgroundColor = [UIColor redColor];
        _poiBriefTView.layer.cornerRadius = 5;
        _poiBriefTView.layer.masksToBounds = YES;
        _poiBriefTView.delegate = self;
        _poiBriefTView.dataSource = self;
        [_poiBriefTView addGestureRecognizer:self.swipeUp];
        [_poiBriefTView addGestureRecognizer:self.swipeDown];

        
        
  }
  return _poiBriefTView;
}

-(PoiBriefHeader *)poiBriefHeader{
    if (!_poiBriefHeader) {
        _poiBriefHeader = [[PoiBriefHeader alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT-10-105,  SCREEN_WIDTH - 20, 48)];
    }
    return _poiBriefHeader;

}

-(UIButton *)unfoldBtn{
    if (!_unfoldBtn) {
        _unfoldBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _unfoldBtn.backgroundColor = [UIColor greenColor];
        [_unfoldBtn addTarget:self action:@selector(unfoldTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _unfoldBtn;
    
}

-(void)updateTableViewState{
    BOOL isUnfold = self.poiBriefTView.isUnfold;
    
    if (isUnfold) {
//        if (self.poiBriefTView.isUnfold) {
//            return;
//        }
//        self.poiBriefTView.cheight = (48+55+95*2+40);
//        self.poiBriefTView.ctop -= (95*2 + 40);
//        [self.poiBriefTView beginUpdates];
//        [self.poiBriefTView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
//        [self.poiBriefTView endUpdates];
//        self.poiBriefTView.isUnfold = !isUnfold;
    }else{
//        self.poiBriefTView.cheight = 105;
//        self.poiBriefTView.ctop += (95*2 + 40);
//        [self.poiBriefTView reloadData];
//        
    }
}

-(void)swipeAction:(UISwipeGestureRecognizer*)swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        self.poiBriefTView.isUnfold = YES;
//        self.poiBriefTView.cheight = (48+55+95*2+40);
//        self.poiBriefTView.ctop -= (95*2 + 40);
//        [self.poiBriefTView beginUpdates];
//        [self.poiBriefTView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
//        [self.poiBriefTView endUpdates];
    }else if(swipe.direction == UISwipeGestureRecognizerDirectionDown){
//        self.poiBriefTView.isUnfold = NO;
//        self.poiBriefTView.cheight = 105;
//        self.poiBriefTView.ctop += (95*2 + 40);
//        [self.poiBriefTView reloadData];
    }else{
    
    }
    
}

-(UISwipeGestureRecognizer *)swipeUp{
    if (!_swipeUp) {
        _swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
        _swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
        
    }
    return _swipeUp;
}

-(UISwipeGestureRecognizer *)swipeDown{
    if (!_swipeDown) {
        _swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
        _swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
        
    }
    return _swipeDown;
}

@end
