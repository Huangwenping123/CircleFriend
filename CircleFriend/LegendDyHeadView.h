//
//  LegendDyHeadView.h
//  CircleFriend
//
//  Created by sishengxiu on 17/3/9.
//  Copyright © 2017年 司胜修. All rights reserved.
//  朋友圈 表头

#import <UIKit/UIKit.h>
@class LegendDyHeadModel;
@interface LegendDyHeadView : UIView
/**进入我的相册*/
@property  (nonatomic, copy) void (^enterMyPhotoGallery)();
- (void)configUserInfo:(LegendDyHeadModel *)model;

@end

@interface LegendDyHeadModel : NSObject
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *backImageStr;
@property (nonatomic, copy) NSString *headImgStr;
@property (nonatomic, assign) NSInteger unReadCount;




@end
