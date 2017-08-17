//
//  HeaderButton.m
//  QQGroup
//
//  Created by csdc on 2017/8/17.
//  Copyright © 2017年 csdc. All rights reserved.
//

#import "HeaderButton.h"

@implementation HeaderButton

+ (instancetype)buttonWithTarget:(id)target action:(SEL)action {
    HeaderButton *button = [self buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 40)];
    [button setBackgroundColor:[UIColor blackColor]];
    [button.titleLabel setFont:[UIFont systemFontOfSize:19]];
    [button.layer setBorderColor:[UIColor whiteColor].CGColor];
    [button.layer setBorderWidth:0.5];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat height = CGRectGetHeight(contentRect);
    return CGRectMake(0, 0, height, height);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return  CGRectMake(40, 0, CGRectGetWidth(contentRect) - 55, CGRectGetHeight(contentRect));
}

@end
