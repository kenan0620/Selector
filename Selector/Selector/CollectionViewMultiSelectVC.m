//
//  CollectionViewMultiSelectVC.m
//  Selector
//
//  Created by mac on 2019/7/17.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import "CollectionViewMultiSelectVC.h"

#import "SelectModel.h"
#import "SelectCollectionViewCell.h"
#define SelectMultiSelectCellID @"SelectMultiSelectCellID"

@interface CollectionViewMultiSelectVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionView *multiSelectCollectionView;
@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation CollectionViewMultiSelectVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSStringFromClass([self class]);
    [self.multiSelectCollectionView registerClass:[SelectCollectionViewCell class] forCellWithReuseIdentifier:SelectMultiSelectCellID];
    [self.view addSubview:self.multiSelectCollectionView];
    [self.multiSelectCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.multiSelectCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(configData)];
    self.multiSelectCollectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshData)];
    [self.multiSelectCollectionView.mj_header beginRefreshing];
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
    [self.multiSelectCollectionView.mj_header endRefreshing];
    [self.multiSelectCollectionView reloadData];
    
}

- (void)footerRefreshData{
    NSArray *data = @[@{@"nameStr":@"测试11",@"isSelected":@"0"},@{@"nameStr":@"测试12",@"isSelected":@"0"},@{@"nameStr":@"测试13",@"isSelected":@"0"},@{@"nameStr":@"测试14",@"isSelected":@"0"},@{@"nameStr":@"测试15",@"isSelected":@"0"},@{@"nameStr":@"测试16",@"isSelected":@"0"},@{@"nameStr":@"测试17",@"isSelected":@"0"},@{@"nameStr":@"测试18",@"isSelected":@"0"},@{@"nameStr":@"测试19",@"isSelected":@"0"},@{@"nameStr":@"测试20",@"isSelected":@"0"},];
    NSDictionary *originData = @{@"data":data};
    
    NSArray *originDataList = originData[@"data"];
    for (NSDictionary *selectData in originDataList) {
        SelectModel *model = [SelectModel yy_modelWithDictionary:selectData];
        [self.dataList addObject:model];
    }
    [self.multiSelectCollectionView.mj_footer endRefreshing];
    [self.multiSelectCollectionView reloadData];
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SelectCollectionViewCell *cell = (SelectCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    SelectModel *model = cell.model;
    model.isSelected = !model.isSelected;
    cell.model = model;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SelectMultiSelectCellID forIndexPath:indexPath];
    cell.model = self.dataList[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

#pragma mark -  UILazy

- (UICollectionView *)multiSelectCollectionView{
    if (!_multiSelectCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _multiSelectCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _multiSelectCollectionView.delegate = self;
        _multiSelectCollectionView.dataSource = self;
        _multiSelectCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _multiSelectCollectionView;
}


@end
