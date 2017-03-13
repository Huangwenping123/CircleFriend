//
//  LegendCommentView.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/10.
//  Copyright © 2017年 司胜修. All rights reserved.
// 评论表

#import "LegendCommentView.h"
@interface LegendCommentView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LegendCommentView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:245 green:246 blue:247 alpha:1];
        
        self.delegate = self;
        self.dataSource = self;
    }
    
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * const cellIdentifier = @"coment";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.textLabel.text = @"评论内容";
    }
    
    
    return cell;
}

- (void)setComentArray:(NSArray<CommentModel *> *)comentArray{
    
    _comentArray = comentArray;
    [self reloadData];
}

@end
