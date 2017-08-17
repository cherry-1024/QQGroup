//
//  GroupCell.h
//  QQGroup
//
//  Created by csdc on 2017/8/17.
//  Copyright © 2017年 csdc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendModel.h"

@interface GroupCell : UITableViewCell

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;

- (void)updataWithFriendModel:(FriendModel *)model;

@end
