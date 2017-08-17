//
//  GroupHeaderView.h
//  QQGroup
//
//  Created by csdc on 2017/8/17.
//  Copyright © 2017年 csdc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderButton.h"
#import "GroupModel.h"

@interface GroupHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) HeaderButton *headerButton;
@property (nonatomic, assign, readonly) BOOL *isOpen;
@property (nonatomic, copy) void (^openHandler)(BOOL isOpen);

- (void)updateHeaderViewWithModel:(GroupModel *)model;

@end
