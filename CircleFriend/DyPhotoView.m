//
//  DyPhotoView.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/7.
//  Copyright © 2017年 司胜修. All rights reserved.
//

#import "DyPhotoView.h"
#import "UIImageView+WebCache.h"
#import "SDPhotoBrowser.h"
#import "Masonry.h"
@interface DyPhotoView()<SDPhotoBrowserDelegate>
{
    UICollectionViewFlowLayout *flowLayout;
    BOOL isLoadCollectionview;
}
@property (nonatomic, strong) NSArray *imageViewsArray;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, strong) UIView *videoView;

@end
@implementation DyPhotoView
- (instancetype)initWithWidth:(CGFloat)width{
    if (self = [super init]) {
        NSAssert(width>0, @"请设置图片容器的宽度");
        self.width = width;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        [self addSubview:imageView];
        imageView.backgroundColor = [UIColor lightGrayColor];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
        [imageView addGestureRecognizer:tap];
        [temp addObject:imageView];
    }
    
    self.imageViewsArray = [temp copy];
    
    self.videoView = [[UIView alloc] initWithFrame:self.bounds];
    self.videoView.hidden = YES;
    [self addSubview:self.videoView];
}

- (void)setPicUrlArray:(NSArray *)picUrlArray{
    self.videoView.hidden = YES;
    _picUrlArray = picUrlArray;
    
    for (long i = _picUrlArray.count; i < self.imageViewsArray.count; i++) {
        UIImageView *imageView = [self.imageViewsArray objectAtIndex:i];
        imageView.hidden = YES;
    }
    
    if (_picUrlArray.count == 0) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        return;
    }
    
    CGFloat itemW = [self itemWidthForPicPathArray:_picUrlArray];
    CGFloat itemH = itemW;
    
    long perRowItemCount = [self perRowItemCountForPicPathArray:_picUrlArray];
    CGFloat margin = 5;
    
    for (int i = 0; i< _picUrlArray.count; i++) {
        NSString *obj     =  _picUrlArray[i];
        long columnIndex = i % perRowItemCount;
        long rowIndex    = i / perRowItemCount;
        
        UIImageView *imageView = self.imageViewsArray[i];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.hidden = NO;
        [imageView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:@"workgroup_img_defaultPhoto"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            if (image.size.width < itemW || image.size.height < itemW) {
                imageView.contentMode = UIViewContentModeScaleAspectFit;
            }
        }
         ];
        
        imageView.frame = CGRectMake(columnIndex * (itemW + margin), rowIndex * (itemH + margin), itemW, itemH);
        
    }
    
    int columnCount = ceilf(_picUrlArray.count * 1.0 / perRowItemCount);
    CGFloat h = columnCount * itemH + (columnCount - 1) * margin;
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.offset(h);
        NSLog(@"====%g=====",h);
    }];
    
}

- (void)setVideoUrl:(NSString *)videoUrl{
    
    if (videoUrl.length>0) {
        self.videoView.hidden = NO;
        [self bringSubviewToFront:self.videoView];
        
        
    }
}

#pragma mark - private actions

- (void)tapImageView:(UITapGestureRecognizer *)tap
{
    UIView *imageView = tap.view;
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.currentImageIndex = imageView.tag;
    browser.sourceImagesContainerView = self;
    browser.imageCount = self.picUrlArray.count;
    browser.delegate = self;
    [browser show];
}

- (CGFloat)itemWidthForPicPathArray:(NSArray *)array
{
    if (array.count == 1) {
        return 120;
    } else {
        CGFloat itemW = (self.width -10) /3 ;
        return itemW;
    }
}

- (NSInteger)perRowItemCountForPicPathArray:(NSArray *)array
{
    if (array.count < 3) {
        return array.count;
    } else if (array.count == 4) {
        return 2;
    } else {
        return 3;
    }
}

#pragma mark - SDPhotoBrowserDelegate

- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSURL *url = [[NSURL alloc] init];
    if (index < self.picOriArray.count) {
        url = [NSURL URLWithString:self.picOriArray[index]];
    }
    return url;
}

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    UIImageView *imageView = self.subviews[index];
    return imageView.image;
}




@end
