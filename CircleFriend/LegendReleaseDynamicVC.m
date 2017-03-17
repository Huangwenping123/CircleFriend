//
//  LegendReleaseDynamicVCViewController.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/13.
//  Copyright © 2017年 司胜修. All rights reserved.
//

#import "LegendReleaseDynamicVC.h"
#import "Masonry.h"
#import "LegendReleaseDyHeadView.h"
@interface LegendReleaseDynamicVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *dataTable;
    NSString *contenText;

}
@property (nonatomic, strong) LegendReleaseDyHeadView *headView;;
@end

@implementation LegendReleaseDynamicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发布动态";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadSubView];
}


- (void)loadSubView{

    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, mScreenWidth, mScreenHeight-64) style:UITableViewStyleGrouped];
    [self.view addSubview:dataTable];
    
    dataTable.tableHeaderView = self.headView;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
    
}

- (UIView *)headView{
    if (!_headView) {
        _headView = [[LegendReleaseDyHeadView alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, 200)];
        _headView.imageArray = nil;
    }
    return _headView;
}

- (void)setImageArray:(NSMutableArray *)imageArray{
    
    _imageArray = imageArray;
}


@end
