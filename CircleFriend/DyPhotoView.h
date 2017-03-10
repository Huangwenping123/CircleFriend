//
//  DyPhotoView.h
//  CircleFriend
//
//  Created by sishengxiu on 17/3/7.
//  Copyright © 2017年 司胜修. All rights reserved.
// 朋友圈图片View

#import <UIKit/UIKit.h>

@interface DyPhotoView : UIView
- (instancetype)initWithWidth:(CGFloat)width;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSArray *picUrlArray;//缩略图URL
@property (nonatomic, strong) NSArray *picOriArray;//原图url

@end
 
