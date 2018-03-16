//
//  ViewController.m
//  tableViewSectionDemo
//
//  Created by PatrickY on 2018/3/16.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "DemoCell.h"
NSString *const cellIdentifier = @"cellIdentifier";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSDictionary                      *teamDict;
@property (nonatomic, strong) NSArray                           *groupNameArray;

@end

@implementation ViewController {
    UITableView                                                 *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"team_dictionary" ofType:@"plist"];
    _teamDict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSArray *tempArray = [_teamDict allKeys];
    //排序
    _groupNameArray = [tempArray sortedArrayUsingSelector:@selector(compare:)];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    //注册
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}


#pragma mark -- UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _groupNameArray.count;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *groupName = _groupNameArray[section];
    
    return groupName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //按照section获取组名
    NSString *groupName = _groupNameArray[section];
    //取出对应组名的球队
    NSArray *tempArray = _teamDict[groupName];
    
    return tempArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DemoCell *cell = [[DemoCell alloc] init];
    //获得section
    NSUInteger section = [indexPath section];
    //获得section的行
    NSUInteger row = [indexPath row];
    //获得组名
    NSString *groupName = _groupNameArray[section];
    //获得对应组名的球队
    NSArray *tempArray = _teamDict[groupName];
    
    cell.textLabel.text = tempArray[row];
    
    return cell;
}
//索引
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    NSMutableArray *tempTitle = [NSMutableArray array];
    for (NSString *item in _groupNameArray) {
        NSString *title = [item substringToIndex:1];
        [tempTitle addObject:title];
    }
    
    return tempTitle;
}

@end


