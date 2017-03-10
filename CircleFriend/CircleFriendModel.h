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
@property (nonatomic, copy) NSString *headIco;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *dyText;
@property (nonatomic, copy) NSString *videoUrl;
@property (nonatomic, assign) BOOL isOpen;
/**
 原图像Url
 */
@property (nonatomic, copy) NSArray *originalPicUrls;
/**
 缩略图Url
 */
@property (nonatomic, copy) NSArray *thumbnailPicUrls;
@property (nonatomic, strong) NSDate *timeDate;
@property (nonatomic, copy) NSArray *commentArray;
@property (nonatomic, assign) BOOL isSelf;
@property (nonatomic, assign) BOOL isCollect;
@end
@interface CommentModel : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *userName;

@end
