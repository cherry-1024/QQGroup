//
//  GroupHeaderView.m
//  QQGroup
//
//  Created by csdc on 2017/8/17.
//  Copyright © 2017年 csdc. All rights reserved.
//

#import "GroupHeaderView.h"

@implementation GroupHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setHeaderButton:[HeaderButton buttonWithTarget:self action:@selector(headerButtonClicked:)]];
        [self.contentView addSubview:self.headerButton];
    }
    return self;
}

- (void)updateHeaderViewWithModel:(GroupModel *)model {
    [self.headerButton setTitle:[NSString stringWithFormat:@"%@(%@)",model.title,model.online] forState:UIControlStateNormal];
    if (model.isOpen) {
        [self.headerButton.imageView setTransform:CGAffineTransformMakeRotation(M_PI_2)];
    }else {
        // 返回初始状态
        [self.headerButton.imageView setTransform:CGAffineTransformIdentity];
    }
    _isOpen = !model.isOpen;
}

- (void)headerButtonClicked:(HeaderButton *)sender {
    self.openHandler(_isOpen);
}

@end
