//
//  CollectionViewRadioVC.m
//  Selector
//
//  Created by mac on 2019/7/17.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import "CollectionViewRadioVC.h"

#import "SelectModel.h"
#import "SelectCollectionViewCell.h"
#define SelectRadioCellID @"SelectRadioCellID"

@interface CollectionViewRadioVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionView *radioCollectionView;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation CollectionViewRadioVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSStringFromClass([self class]);
    [self.radioCollectionView registerClass:[SelectCollectionViewCell class] forCellWithReuseIdentifier:SelectRadioCellID];
    [self.view addSubview:self.radioCollectionView];
    [self.radioCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.radioCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(configData)];
    self.radioCollectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshData)];
    [self.radioCollectionView.mj_header beginRefreshing];
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
    [self.radioCollectionView.mj_header endRefreshing];
    [self.radioCollectionView reloadData];
    
}

- (void)footerRefreshData{
    NSArray *data = @[@{@"nameStr":@"测试11",@"isSelected":@"0"},@{@"nameStr":@"测试12",@"isSelected":@"0"},@{@"nameStr":@"测试13",@"isSelected":@"0"},@{@"nameStr":@"测试14",@"isSelected":@"0"},@{@"nameStr":@"测试15",@"isSelected":@"0"},@{@"nameStr":@"测试16",@"isSelected":@"0"},@{@"nameStr":@"测试17",@"isSelected":@"0"},@{@"nameStr":@"测试18",@"isSelected":@"0"},@{@"nameStr":@"测试19",@"isSelected":@"0"},@{@"nameStr":@"测试20",@"isSelected":@"0"},];
    NSDictionary *originData = @{@"data":data};
    
    NSArray *originDataList = originData[@"data"];
    for (NSDictionary *selectData in originDataList) {
        SelectModel *model = [SelectModel yy_modelWithDictionary:selectData];
        [self.dataList addObject:model];
    }
    [self.radioCollectionView.mj_footer endRefreshing];
    [self.radioCollectionView reloadData];
}
#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    // !!!: 选择一种使用的方法，其余的注释掉或者删除
    #pragma mark -  Method 1 Start
    /**
     此种单选方法仅仅支持一次性加载完选择数据，如果有数据上拉加载，则不支持。
     */
//    [self configCellStatus:collectionView IndexPath:indexPath Status:YES];
    #pragma mark -  Method 1 End
    
    
        #pragma mark -  Method 2 Start
//        /**
//         此种单选方法支持所有，会遍历所有数据。
//         */
//        NSMutableArray *array = [NSMutableArray array];
//
//        for (int i = 0; i < self.dataList.count; i++) {
//            SelectModel *model = self.dataList[i];
//            if (i == indexPath.row) {
//                model.isSelected = YES;
//            }else{
//                model.isSelected = NO;
//            }
//            [array addObject:model];
//        }
//        //更换数据源
//        self.dataList = array;
//        [collectionView reloadData];
        #pragma mark -  Method 2 End
    
        #pragma mark -  Method 3 Start
        /**
         此种单选方法在加载数据的时候会刷新原有cell选中状态。每次刷新后全部为未选中状态。
         */
        [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:(UICollectionViewScrollPositionTop)];
        #pragma mark -  Method 3 End
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
#pragma mark -  Method 1 Start
    /**
     此种单选方法仅仅支持一次性加载完选择数据，如果有数据上拉加载，则不支持。
     */
//    [self configCellStatus:collectionView IndexPath:indexPath Status:NO];
#pragma mark -  Method 1 End
    
}

- (void)configCellStatus:(UICollectionView *)collectionView IndexPath:(NSIndexPath *)indexPath Status:(BOOL)status{
    SelectCollectionViewCell *cell = (SelectCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    SelectModel *model = cell.model;
    model.isSelected = status;
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
    SelectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SelectRadioCellID forIndexPath:indexPath];
    cell.model = self.dataList[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

#pragma mark -  UILazy

- (UICollectionView *)radioCollectionView{
    if (!_radioCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _radioCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _radioCollectionView.delegate = self;
        _radioCollectionView.dataSource = self;
        _radioCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _radioCollectionView;
}

@end
