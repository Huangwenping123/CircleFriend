//
//  LegendDyHeadView.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/9.
//  Copyright © 2017年 司胜修. All rights reserved.
//

#import "LegendDyHeadView.h"
#import "Masonry.h"
@interface LegendDyHeadView()

@property (nonatomic, strong) UIImageView *backgroundImg;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UIImageView *headImg;
@property (nonatomic, strong) UILabel *remindLabel;
@property (nonatomic, strong) UIView *lineView;
@end
@implementation LegendDyHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubView];
        
    }
    return self;
    
}
- (void)loadSubView{
    
    self.backgroundImg = [[UIImageView alloc] init];
    self.backgroundImg.image = [UIImage imageNamed:@"tx.jpeg"];
    self.backgroundImg.backgroundColor = [UIColor grayColor];
    [self addSubview:self.backgroundImg];
    
    self.nickNameLabel = [[UILabel alloc] init];
    self.nickNameLabel.textColor = [UIColor whiteColor];
    self.nickNameLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.nickNameLabel];
    
    self.headImg = [[UIImageView alloc] init];
    self.headImg.layer.masksToBounds = YES;
    self.headImg.backgroundColor = [UIColor lightGrayColor];
    self.headImg.layer.cornerRadius = 75*m6Scale;
    [self addSubview:self.headImg];
    
    self.remindLabel = [[UILabel alloc] init];
    self.remindLabel.backgroundColor = [UIColor grayColor];
    self.remindLabel.textAlignment = NSTextAlignmentCenter;
    self.remindLabel.layer.masksToBounds = YES;
    self.remindLabel.layer.cornerRadius = 10*m6Scale;
    self.remindLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.remindLabel];
    
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView];
    //固定布局 所以不用动态改变 所以直接布局
    
    [self.backgroundImg mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self).offset(-240*m6Scale);
    }];
    
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self).offset(-20*m6Scale);
        make.top.equalTo(self).offset(410*m6Scale);
        make.size.sizeOffset(CGSizeMake(150*m6Scale, 150*m6Scale));
    }];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.headImg.mas_left).offset(-20*m6Scale);
        make.bottom.equalTo(self.backgroundImg.mas_bottom).offset(-20*m6Scale);
    }];
    
    [self.remindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-25*m6Scale);
        make.width.offset(360*m6Scale);
        make.height.offset(80*m6Scale);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.equalTo(self);
        make.bottom.equalTo(self).offset(-1);
        make.height.offset(1);
        
    }];
    
}


- (void)configUserInfo:(LegendDyHeadModel *)model{
    
    
    self.nickNameLabel.text = model.username;
    if (model.unReadCount>0) {
        self.remindLabel.hidden = NO;
        self.remindLabel.text = [NSString stringWithFormat:@"%ld条新消息",model.unReadCount];
    }

}



@end




@implementation LegendDyHeadModel



@end
