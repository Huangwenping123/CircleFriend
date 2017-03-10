//
//  LegendAttentionCell.h
//  CircleFriend
//
//  Created by sishengxiu on 17/3/9.
//  Copyright © 2017年 司胜修. All rights reserved.
//  关注

#import <UIKit/UIKit.h>
@class LegendAttentionModel;
@interface LegendAttentionCell : UITableViewCell
- (void)configCellWithModel:(LegendAttentionModel *)model;
@end

@interface LegendAttentionModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ico;
@end
