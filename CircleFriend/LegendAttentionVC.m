//
//  LegendAttentionVC.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/9.
//  Copyright © 2017年 司胜修. All rights reserved.
//

#import "LegendAttentionVC.h"
#import "LegendAttentionCell.h"
#import "CircleFriendVC.h"
@interface LegendAttentionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation LegendAttentionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor colorWithDisplayP3Red:239 green:240 blue:241 alpha:1];
    [self.tableView registerClass:[LegendAttentionCell class] forCellReuseIdentifier:@"attention"];
    
}
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        self.tableView.rowHeight = 80;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 30;
    }
    else{
        return CGFLOAT_MIN;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        return 15;
    }
    else{
        return CGFLOAT_MIN;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LegendAttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"attention" forIndexPath:indexPath];
    LegendAttentionModel *model = [[LegendAttentionModel alloc] init];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            model.title = @"豆豆圈";
            model.ico= @"AlbumReflashIcon";
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            model.title = @"舆情";
            model.ico = @"MoreGame";
        }
    }
    
    [cell configCellWithModel:model];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            CircleFriendVC *circleVC = [[CircleFriendVC alloc] init];
            [self.navigationController pushViewController:circleVC animated:YES];
        }
    }
}




@end
