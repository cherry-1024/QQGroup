//
//  GroupCell.m
//  QQGroup
//
//  Created by csdc on 2017/8/17.
//  Copyright © 2017年 csdc. All rights reserved.
//

#import "GroupCell.h"

@implementation GroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        [self.contentView addSubview:self.avatarImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 7, 120, 21)];
        [self.contentView addSubview:self.titleLabel];
        
        self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 34, 250, 21)];
        [self.contentView addSubview:self.subtitleLabel];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 0.35)];
        lineView.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:lineView];
    }
    return self;
}

- (void)updataWithFriendModel:(FriendModel *)model {
    self.avatarImageView.image = [UIImage imageNamed:model.icon];
    self.titleLabel.text = model.name;
    self.subtitleLabel.text = model.message;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
