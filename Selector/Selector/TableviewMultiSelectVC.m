//
//  TableviewMultiSelectVC.m
//  Selector
//
//  Created by mac on 2019/7/17.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import "TableviewMultiSelectVC.h"

#import "CustomTableViewCell.h"
#import "SelectModel.h"

@interface TableviewMultiSelectVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableViewMultiSelect;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation TableviewMultiSelectVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSStringFromClass([self class]);
    [self.view addSubview:self.tableViewMultiSelect];
    
    [self.tableViewMultiSelect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableViewMultiSelect.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(configData)];
    
    self.tableViewMultiSelect.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshData)];
    [self.tableViewMultiSelect.mj_header beginRefreshing];
}

- (void)configData{
    ///每次下拉刷新清除数据后再加载
    self.dataList = [NSMutableArray array];
    NSArray *data = @[@{@"nameStr":@"测试1",@"isSelected":@"0"},@{@"nameStr":@"测试2",@"isSelected":@"0"},@{@"nameStr":@"测试3",@"isSelected":@"0"},@{@"nameStr":@"测试4",@"isSelected":@"0"},@{@"nameStr":@"测试5",@"isSelected":@"0"},@{@"nameStr":@"测试6",@"isSelected":@"0"},@{@"nameStr":@"测试7",@"isSelected":@"0"},@{@"nameStr":@"测试8",@"isSelected":@"0"},@{@"nameStr":@"测试9",@"isSelected":@"0"},@{@"nameStr":@"测试10",@"isSelected":@"0"}];
    NSDictionary *originData = @{@"data":data};
    
    NSArray *originDataList = originData[@"data"];
    for (NSDictionary *selectData in originDataList) {
        SelectModel *model = [SelectModel yy_modelWithDictionary:selectData];
        [self.dataList addObject:model];
    }
    [self.tableViewMultiSelect.mj_header endRefreshing];
    [self.tableViewMultiSelect reloadData];
    
}

- (void)footerRefreshData{
    NSArray *data = @[@{@"nameStr":@"测试11",@"isSelected":@"0"},@{@"nameStr":@"测试12",@"isSelected":@"0"},@{@"nameStr":@"测试13",@"isSelected":@"0"},@{@"nameStr":@"测试14",@"isSelected":@"0"},@{@"nameStr":@"测试15",@"isSelected":@"0"},@{@"nameStr":@"测试16",@"isSelected":@"0"},@{@"nameStr":@"测试17",@"isSelected":@"0"},@{@"nameStr":@"测试18",@"isSelected":@"0"},@{@"nameStr":@"测试19",@"isSelected":@"0"},@{@"nameStr":@"测试20",@"isSelected":@"0"},];
    NSDictionary *originData = @{@"data":data};
    
    NSArray *originDataList = originData[@"data"];
    for (NSDictionary *selectData in originDataList) {
        SelectModel *model = [SelectModel yy_modelWithDictionary:selectData];
        [self.dataList addObject:model];
    }
    [self.tableViewMultiSelect.mj_footer endRefreshing];
    [self.tableViewMultiSelect reloadData];
}

#pragma mark -  UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    SelectModel *model = cell.selectModel;
    model.isSelected = !model.isSelected;
    cell.selectModel = model;
}

#pragma mark -  UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"CustomTableViewCellID";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[CustomTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selectModel = self.dataList[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

#pragma mark -  UILazy

- (UITableView *)tableViewMultiSelect{
    if (!_tableViewMultiSelect) {
        _tableViewMultiSelect = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableViewMultiSelect.delegate = self;
        _tableViewMultiSelect.dataSource = self;
    }
    return _tableViewMultiSelect;
}

- (NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

@end
