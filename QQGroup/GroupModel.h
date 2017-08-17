//
//  GroupModel.h
//  QQGroup
//
//  Created by csdc on 2017/8/17.
//  Copyright © 2017年 csdc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject

@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) NSString *online;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL isOpen;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
