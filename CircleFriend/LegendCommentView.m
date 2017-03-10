//
//  LegendCommentView.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/10.
//  Copyright © 2017年 司胜修. All rights reserved.
//

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

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [UITableViewCell alloc];
    
    
    return cell;
}

@end
