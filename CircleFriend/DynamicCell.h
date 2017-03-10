//
//  DynamicCell.h
//  CircleFriend
//
//  Created by sishengxiu on 17/3/7.
//  Copyright © 2017年 司胜修. All rights reserved.
//  朋友圈cell

#import <UIKit/UIKit.h>
#import "CircleFriendModel.h"

@interface DynamicCell : UITableViewCell
@property (nonatomic, strong) CircleFriendModel *model;
//回调
/**查看新消息*/
@property  (nonatomic, copy) void (^lookNewMessage)();
/**转发动态*/
@property  (nonatomic, copy) void (^transpondDy)();
/**点赞*/
@property  (nonatomic, copy) void (^colllectDy)(BOOL isLike);
/**评论*/
@property  (nonatomic, copy) void (^commentDy)();
/**删除动态*/
@property  (nonatomic, copy) void (^deleteDy)();
//进入地图
@property (nonatomic, copy) void (^enterMap)();

@property (nonatomic, copy) void (^showMore)(BOOL isOpen);

@end
