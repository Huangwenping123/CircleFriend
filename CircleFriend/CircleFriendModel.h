//
//  CircleFriendModel.h
//  CircleFriend
//
//  Created by sishengxiu on 17/3/7.
//  Copyright © 2017年 司胜修. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "MJExtension.h"

@interface CircleFriendModel : NSObject
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *headIco;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *dyText;
@property (nonatomic, copy) NSString *videoUrl;
@property (nonatomic, assign) BOOL isOpen;

@property (nonatomic, copy) NSArray *originalPicUrls;/**原图像Url*/
@property (nonatomic, copy) NSArray *thumbnailPicUrls;// 缩略图Url
@property (nonatomic, strong) NSDate *timeDate;
@property (nonatomic, copy) NSArray *commentArray;
@property (nonatomic, assign) BOOL isSelf;
@property (nonatomic, assign) BOOL isCollect;
@property (nonatomic, copy) NSArray *praiseArray;

@end

//赞模型
@interface PraiseModel : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *userName;

@end


/**
 评论模型
 */
@interface CommentModel : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *commentText;

@property (nonatomic, copy) NSString *answerUserID;
@property (nonatomic, copy) NSString *answerName;
@end
