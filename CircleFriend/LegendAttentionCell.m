//
//  LegendAttentionCell.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/9.
//  Copyright © 2017年 司胜修. All rights reserved.
//

#import "LegendAttentionCell.h"
#import "Masonry.h"
@interface LegendAttentionCell()
@property (nonatomic, strong) UIImageView *icoImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation LegendAttentionCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadSubview];
    }
    return self;
}
- (void)loadSubview{
    
    self.icoImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.icoImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    
    
    [self.icoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.sizeOffset(CGSizeMake(40, 40));
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(15);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.icoImageView.mas_right).offset(10);
    }];
    
}

- (void)configCellWithModel:(LegendAttentionModel *)model{
    
    self.icoImageView.image = [UIImage imageNamed:model.ico];
    self.titleLabel.text = model.title;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


@implementation LegendAttentionModel



@end
