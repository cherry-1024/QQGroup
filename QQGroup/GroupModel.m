//
//  GroupModel.m
//  QQGroup
//
//  Created by csdc on 2017/8/17.
//  Copyright © 2017年 csdc. All rights reserved.
//

#import "GroupModel.h"
#import "FriendModel.h"

@implementation GroupModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

- (void)setFriends:(NSArray *)friends {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dataDict in friends) {
        FriendModel *friendModel = [[FriendModel alloc] init];
        [friendModel setValuesForKeysWithDictionary:dataDict];
        [tempArray addObject:friendModel];
    }
    _friends = [tempArray copy];
}

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    GroupModel *groupModel = [[GroupModel alloc] init];
    [groupModel setValuesForKeysWithDictionary:dict];
    return groupModel;
}
@end
