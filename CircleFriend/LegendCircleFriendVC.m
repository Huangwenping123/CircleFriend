//
//  CircleFriendVC.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/7.
//  Copyright © 2017年 司胜修. All rights reserved.
// 动态主界面

#import "LegendCircleFriendVC.h"
#import "LegendDynamicCell.h"
#import "CircleFriendModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "LegendDyHeadView.h"
#import "LegendReleaseDynamicVC.h"

@interface LegendCircleFriendVC ()
{
    NSMutableArray *dataArray;
}
@property (nonatomic, strong) LegendDyHeadView *headView;
@end

@implementation LegendCircleFriendVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"朋友圈";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LegendDynamicCell class] forCellReuseIdentifier:@"dycell"];
    self.tableView.tableHeaderView = self.headView;

    UIBarButtonItem *releaseBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MoreGame"] style:UIBarButtonItemStylePlain target:self action:@selector(releaseDynamic)];
    self.navigationItem.rightBarButtonItem = releaseBtn;
    [self loadData];
}

/**
 模拟数据装载
 */
- (void)loadData{
    dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    NSString *text = @"天气真的很好.";
    for (int i = 0; i<10; i++) {
        CircleFriendModel *cfmodel = [[CircleFriendModel alloc] init];
        cfmodel.userName = [NSString stringWithFormat:@"ddd哇外%d方法",i];
        NSMutableArray *imarray = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *tmarray = [[NSMutableArray alloc] initWithCapacity:0];
        for (int j=0; j<i; j++) {
            if (j>8) {
                continue;
            }
            [imarray addObject:[NSString stringWithFormat:@"https://testapp.gtax.cn/images/2016/08/25/2241c4b32b8445da87532d6044888f3d.jpg!t300x300.jpg"]];
            [tmarray addObject:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3491670964,88496751&fm=11&gp=0.jpg"];
        }
        cfmodel.thumbnailPicUrls = tmarray;
        cfmodel.originalPicUrls = imarray;
        text = [NSString stringWithFormat:@"%@天气很好很好很好的,美女很美很美的美女很美很美的美女很美很美的美女很美很美的",text];
        NSString *timeStr;
        if (i<5) {
            timeStr = [NSString stringWithFormat:@"2017-3-10 16:%d:%d",50-i,i];
        }else{
            timeStr = [NSString stringWithFormat:@"2017-2-%d 16:%d:%d",i,i,i];
        }
        NSDateFormatter *formate = [[NSDateFormatter alloc] init];
        [formate setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        NSDate *date = [formate dateFromString:timeStr];
        cfmodel.timeDate = date;
        if (i==3) {
            cfmodel.isSelf = YES;
        }
        cfmodel.dyText = text;
        [dataArray addObject:cfmodel];
    }
    LegendDyHeadModel *headModel = [[LegendDyHeadModel alloc]init];
    headModel.username = @"习大大";
    
    headModel.unReadCount = 10;
    [self.headView configUserInfo:headModel];
    [self.tableView reloadData];
}


- (LegendDyHeadView *)headView{
    
    if (!_headView) {
        _headView = [[LegendDyHeadView alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, mScreenWidth)];
        _headView.enterMyPhotoGallery = ^{
            
        };
    }
    return _headView;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LegendDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dycell" forIndexPath:indexPath];
    
    __block CircleFriendModel *model = dataArray[indexPath.row];
    cell.model = model;
    
    cell.showMore = ^(BOOL isOpen){
        model.isOpen = isOpen;
        [dataArray replaceObjectAtIndex:indexPath.row withObject:model];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    cell.deleteDy = ^{
        
    };
    
    cell.commentDy = ^{
        
    };
    cell.transpondDy = ^{
        
    };
    cell.colllectDy = ^(BOOL isLike){
        
    };
    
    cell.lookNewMessage = ^{
        
    };
    cell.enterMap = ^{
        
    };
    
    
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [self.tableView fd_heightForCellWithIdentifier:@"dycell" configuration:^(LegendDynamicCell *cell) {
        [self configureOriCell:cell atIndexPath:indexPath];
    }];
    return height;
}

- (void)configureOriCell:(LegendDynamicCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.fd_enforceFrameLayout = NO;
    if (indexPath.row<dataArray.count) {
        cell.model = dataArray[indexPath.row];
    }
}

- (void)releaseDynamic{
    
    LegendReleaseDynamicVC *releaseVC = [[LegendReleaseDynamicVC alloc] init];
    [self.navigationController pushViewController:releaseVC animated:YES];

}

@end
