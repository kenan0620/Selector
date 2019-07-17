//
//  TableviewRadioVC.m
//  Selector
//
//  Created by mac on 2019/7/17.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import "TableviewRadioVC.h"

#import "CustomTableViewCell.h"
#import "SelectModel.h"

@interface TableviewRadioVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableViewRadio;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation TableviewRadioVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSStringFromClass([self class]);
    [self.view addSubview:self.tableViewRadio];
    
    [self.tableViewRadio mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableViewRadio.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(configData)];
    
    self.tableViewRadio.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshData)];
    [self.tableViewRadio.mj_header beginRefreshing];
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
    [self.tableViewRadio.mj_header endRefreshing];
    [self.tableViewRadio reloadData];
}

- (void)footerRefreshData{
    NSArray *data = @[@{@"nameStr":@"测试11",@"isSelected":@"0"},@{@"nameStr":@"测试12",@"isSelected":@"0"},@{@"nameStr":@"测试13",@"isSelected":@"0"},@{@"nameStr":@"测试14",@"isSelected":@"0"},@{@"nameStr":@"测试15",@"isSelected":@"0"},@{@"nameStr":@"测试16",@"isSelected":@"0"},@{@"nameStr":@"测试17",@"isSelected":@"0"},@{@"nameStr":@"测试18",@"isSelected":@"0"},@{@"nameStr":@"测试19",@"isSelected":@"0"},@{@"nameStr":@"测试20",@"isSelected":@"0"},];
    NSDictionary *originData = @{@"data":data};
    
    NSArray *originDataList = originData[@"data"];
    for (NSDictionary *selectData in originDataList) {
        SelectModel *model = [SelectModel yy_modelWithDictionary:selectData];
        [self.dataList addObject:model];
    }
    [self.tableViewRadio.mj_footer endRefreshing];
    [self.tableViewRadio reloadData];
}

#pragma mark -  UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // !!!: 选择一种使用的方法，其余的注释掉或者删除
    #pragma mark -  Method 1 Start
    /**
     此种单选方法仅仅支持一次性加载完选择数据，如果有数据上拉加载，则不支持。
     */
//    [self configCellStatus:tableView IndexPath:indexPath Status:YES];
    #pragma mark -  Method 1 End
    
    #pragma mark -  Method 2 Start
//    /**
//     此种单选方法支持所有，会遍历所有数据。
//     */
//    NSMutableArray *array = [NSMutableArray array];
//
//    for (int i = 0; i < self.dataList.count; i++) {
//        SelectModel *model = self.dataList[i];
//        if (i == indexPath.row) {
//            model.isSelected = YES;
//        }else{
//            model.isSelected = NO;
//        }
//        [array addObject:model];
//    }
//    //更换数据源
//    self.dataList = array;
//    [tableView reloadData];
    #pragma mark -  Method 2 End
    
    #pragma mark -  Method 3 Start
    /**
     此种单选方法在加载数据的时候会刷新原有cell选中状态。每次刷新后全部为未选中状态。
     */
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:(UITableViewScrollPositionTop)];
    #pragma mark -  Method 3 End

}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    #pragma mark -  Method 1 Start
    /**
     此种单选方法仅仅支持一次性加载完选择数据，如果有数据上拉加载，则不支持。
     */
//    [self configCellStatus:tableView IndexPath:indexPath Status:NO];
    #pragma mark -  Method 1 End
}

- (void)configCellStatus:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath Status:(BOOL)status{
    CustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    SelectModel *model = cell.selectModel;
    model.isSelected = status;
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

- (UITableView *)tableViewRadio{
    if (!_tableViewRadio) {
        _tableViewRadio = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableViewRadio.delegate = self;
        _tableViewRadio.dataSource = self;
    }
    return _tableViewRadio;
}

- (NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

@end
