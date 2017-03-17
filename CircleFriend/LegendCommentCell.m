//
//  LegendCommentCell.m
//  CircleFriend
//
//  Created by sishengxiu on 17/3/15.
//  Copyright © 2017年 司胜修. All rights reserved.
//

#import "LegendCommentCell.h"
#import "MLLinkLabel.h"  //可交互label

@interface LegendCommentCell ()<MLLinkLabelDelegate>
{
    MLLinkLabel *commentlabel;
}
@end
@implementation LegendCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadSubView];

    }
    return self;
}

- (void)loadSubView{
    
//    commentLabel = [[UILabel alloc] init];
//    commentLabel.numberOfLines = 0;
//    [self.contentView addSubview:commentLabel];
    
    commentlabel = [[MLLinkLabel alloc] initWithFrame:self.contentView.frame];
    commentlabel.font = [UIFont systemFontOfSize:14];
    commentlabel.linkTextAttributes = @{NSForegroundColorAttributeName : [UIColor blueColor]};
    [self.contentView addSubview:commentlabel];
}

- (void)setModel:(CommentModel *)model{

    NSString *text = @"";
    if (model.isAnswer) {
        text = [NSString stringWithFormat:@"%@回复%@:%@",model.commentName,model.answerName,model.commentText];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:text];
        [attString setAttributes:@{NSLinkAttributeName : model.commentId} range:[text rangeOfString:model.commentName]];
        [attString setAttributes:@{NSLinkAttributeName : model.answerUserID} range:[text rangeOfString:model.answerName]];
        commentlabel.attributedText = attString;

    }else{
        text = [NSString stringWithFormat:@"%@:%@",model.commentName,model.commentText];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:text];
        [attString setAttributes:@{NSLinkAttributeName : model.commentId} range:[text rangeOfString:model.commentName]];
        commentlabel.attributedText = attString;
    }
    commentlabel.didClickLinkBlock = ^(MLLink *link, NSString *linkText, MLLinkLabel *label){
        NSLog(@"%@",link.linkValue);
    };
    
}

@end
