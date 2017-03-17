//
//  LegendCommentView.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/10.
//  Copyright © 2017年 司胜修. All rights reserved.
// 评论表

#import "LegendCommentView.h"
#import "Masonry.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "LegendCommentCell.h"
@interface LegendCommentView()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation LegendCommentView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:245 green:246 blue:247 alpha:1];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.delegate = self;
        self.dataSource = self;
        self.scrollEnabled = NO;
        self.bounces = NO;
        self.rowHeight = 30;
        [self registerClass:[LegendCommentCell class] forCellReuseIdentifier:@"coment"];
    }
    
    return self;
}
- (void)loadData{

    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _comentArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CommentModel *model = _comentArray[indexPath.row];
    LegendCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"coment"];
    cell.model = model;
    return cell;

}
//- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CGFloat height = [self fd_heightForCellWithIdentifier:@"dycell" configuration:^(LegendCommentCell *cell) {
//        [self configureOriCell:cell atIndexPath:indexPath];
//    }];
//    return height;
//}

- (void)configureOriCell:(LegendCommentCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.fd_enforceFrameLayout = NO;
    if (indexPath.row<_comentArray.count) {
        cell.model = _comentArray[indexPath.row];
    }
}


- (void)setComentArray:(NSArray<CommentModel *> *)comentArray{
    
//    _comentArray = comentArray;
//    [self mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.offset(15*4);
//    }];
//    [self reloadData];
//    
    _comentArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0 ; i<5; i++) {
        CommentModel *model = [[CommentModel alloc] init];
        model.userID = [NSString stringWithFormat:@"%i",i];
        model.commentId = [NSString stringWithFormat:@"%i",i+1000];
        model.commentName = @"wxs";
        model.commentText = @"明天一起去吃饭dddddddddddddddddddddddddddddasdadsadasdasdasdsadasd";
        if (i%2==0) {
            model.isAnswer = YES;
            model.answerUserID = [NSString stringWithFormat:@"%d",i+100];
            model.answerName = @"dwrr";
        }
        [_comentArray addObject:model];
    }
    [self reloadData];
}

@end
