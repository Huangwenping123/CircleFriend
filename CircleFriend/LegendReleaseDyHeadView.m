//
//  LegendReleaseDyView.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/14.
//  Copyright © 2017年 司胜修. All rights reserved.
//

#import "LegendReleaseDyHeadView.h"
#import "UIImageView+WebCache.h"
#import "SDPhotoBrowser.h"
#import "Masonry.h"


@interface LegendReleaseDyHeadView ()<SDPhotoBrowserDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UITextView *contentText;
    UIButton *addBtn;
    CGFloat intervalSpace;
    CGFloat btnWidth;
    UICollectionView *dataView;
    CGFloat headHeight;
    CGRect selfFrame;

}
@end
@implementation LegendReleaseDyHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        selfFrame = frame;
        self.backgroundColor = [UIColor whiteColor];
        headHeight = self.frame.size.height;
        [self loadSubView];
    }
    return self;
}

- (void)loadSubView{

    intervalSpace = 10;
    btnWidth = (mScreenWidth-4*intervalSpace)/4;
    
    contentText = [[UITextView alloc] init];
    contentText.font = [UIFont systemFontOfSize:17];
//    textField.placeholder = @"这一刻的想法";
//    textField.adjustsFontSizeToFitWidth = YES;
    [self addSubview:contentText];

    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.itemSize = CGSizeMake(btnWidth, btnWidth);
    flowlayout.minimumLineSpacing = 15;
    flowlayout.minimumInteritemSpacing = 5;
    flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    dataView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 5, mScreenWidth-10, btnWidth+15) collectionViewLayout:flowlayout];
    dataView.scrollEnabled = NO;
    [dataView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];

    dataView.backgroundColor = [UIColor whiteColor];
    dataView.dataSource = self;
    dataView.delegate = self;
    [self addSubview:dataView];
    
    [contentText mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.height.offset(90);
        make.left.equalTo(self).offset(5);
        make.right.equalTo(self).offset(5);
        make.top.equalTo(self).offset(5);
    }];
    
    [dataView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.height.offset(90);
        make.top.equalTo(contentText.mas_bottom).offset(5);
        make.left.equalTo(self.mas_left).offset(5);
        make.right.equalTo(self.mas_right).offset(-5);
    }];
    
    
    
    
    
    
}

#pragma mark - uicollectionview data delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_imageArray.count<9) {
        return _imageArray.count+1;
    }else{
        return _imageArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:cell.bounds];
    if (indexPath.item<_imageArray.count||_imageArray.count==9) {
        imageview.image = _imageArray[indexPath.item];
    }else{
        imageview.image = [UIImage imageNamed:@"tianjia"];
    }
    [cell addSubview:imageview];


    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item<_imageArray.count||_imageArray.count==9) {
        [self enterImageview:_imageArray[indexPath.item] WithIndex:indexPath.item];

    }
    else{
     
        [self addImage];
    }
 
}

- (void)setImageArray:(NSMutableArray *)imageArray{
    _imageArray = [[NSMutableArray alloc]initWithArray:imageArray];
    [self reloadDataSource];
}
- (void)reloadDataSource{

    NSInteger num = _imageArray.count;
    if (num>3) {
        [dataView mas_updateConstraints:^(MASConstraintMaker *make) {
            NSLog(@"headView的高度%g",intervalSpace*2+btnWidth+(btnWidth+intervalSpace)*(num/4));
            make.height.offset(intervalSpace*2+btnWidth+(btnWidth+intervalSpace)*(num/4));
        }];

        CGRect newFrame = selfFrame;
        newFrame.size.height = (btnWidth+intervalSpace)*(num/4)+headHeight;
        self.frame = newFrame;
    }

    [dataView reloadData];
}

- (void)addImage{
    NSLog(@"添加图片");
    [_imageArray addObject:[UIImage imageNamed:@"ceshi"]];
    [self reloadDataSource];
}

#pragma mark - private actions

- (void)enterImageview:(UIImage *)image WithIndex:(NSInteger)index
{
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.currentImageIndex = index;
    browser.sourceImagesContainerView = self;
    browser.imageCount = self.imageArray.count;
    browser.delegate = self;
    [browser show];
    
}


#pragma mark - SDPhotoBrowserDelegate



- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
//    UIImageView *imageView = self.subviews[index];
    return _imageArray[index];
}


@end
