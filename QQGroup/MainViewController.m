//
//  MainViewController.m
//  QQGroup
//
//  Created by csdc on 2017/8/17.
//  Copyright © 2017年 csdc. All rights reserved.
//

#import "MainViewController.h"
#import "GroupCell.h"
#import "GroupModel.h"
#import "FriendModel.h"
#import "GroupHeaderView.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *groupArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"QQ分组";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[GroupCell class] forCellReuseIdentifier:@"GroupCell"];
    [self.tableView registerClass:[GroupHeaderView class] forHeaderFooterViewReuseIdentifier:@"HeaderView"];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 重写get方法
- (NSArray *)groupArray {
    if (!_groupArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"qq_group" ofType:@"plist"];
        NSArray *groupArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *groupDict in groupArray) {
            GroupModel *groupModel = [GroupModel modelWithDict:groupDict];
            [tempArray addObject:groupModel];
        }
        _groupArray = [tempArray copy];
    }
    return _groupArray;
}

#pragma mark - Table view delegate - 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    GroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderView"];
    GroupModel *groupModel = self.groupArray[section];
    [headerView updateHeaderViewWithModel:groupModel];
    [headerView setOpenHandler:^(BOOL isOpen){
        groupModel.isOpen = isOpen;
        [tableView reloadData];
    }];
    return headerView;
}

#pragma mark - Table view data source - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupModel *model = self.groupArray[section];
    return model.isOpen? model.friends.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupCell"];
    GroupModel *groupModel = self.groupArray[indexPath.section];
    [cell updataWithFriendModel:groupModel.friends[indexPath.row]];
    return cell;
}
@end
