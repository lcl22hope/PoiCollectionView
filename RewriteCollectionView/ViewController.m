//
//  ViewController.m
//  RewriteCollectionView
//
//  Created by lcl on 15/12/10.
//  Copyright © 2015年 lcl. All rights reserved.
//

#import "ViewController.h"
#import "PoiBriefTableView.h"

@interface ViewController ()

@property (nonatomic, strong) UIImage* img;

@property (nonatomic, strong) PoiBriefTableView *poiBriefTView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.poiBriefTView];
    
    [self.poiBriefTView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.bottom.equalTo(self.view.bottom).offset(-10);
        make.width.equalTo(self.view.width).offset(-20);
        make.height.lessThanOrEqualTo(@320);
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(PoiBriefTableView *)poiBriefTView{
    if (!_poiBriefTView) {
        _poiBriefTView = [[PoiBriefTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-20, 105) style:UITableViewStylePlain];
        _poiBriefTView.backgroundColor = LSCOLOR_HEX(0xffffff);
        _poiBriefTView.layer.cornerRadius = 5;
        _poiBriefTView.layer.masksToBounds= YES;
    }
    return _poiBriefTView;
    
}


@end
