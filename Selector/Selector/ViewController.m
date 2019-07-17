//
//  ViewController.m
//  Selector
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import "ViewController.h"

#import "TableviewRadioVC.h"
#import "TableviewMultiSelectVC.h"
#import "CollectionViewRadioVC.h"
#import "CollectionViewMultiSelectVC.h"

@interface ViewController ()
///tableview 单选
@property (nonatomic, strong) UIButton *tableviewRadioButton;
///tableview 多选
@property (nonatomic, strong) UIButton *tableviewMultiSelectButton;
///collectionView 单选
@property (nonatomic, strong) UIButton *collectionViewRadioButton;
///collectionView 多选
@property (nonatomic, strong) UIButton *collectionViewMultiSelectButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSStringFromClass([self class]);
    
    [self configViewControllerUI];
}

- (void)configViewControllerUI{
    [self.view addSubview:self.tableviewRadioButton];
    [self.view addSubview:self.tableviewMultiSelectButton];
    [self.view addSubview:self.collectionViewRadioButton];
    [self.view addSubview:self.collectionViewMultiSelectButton];
    
    [self.tableviewRadioButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@[self.view,self.tableviewMultiSelectButton,self.collectionViewRadioButton,self.collectionViewMultiSelectButton]);
        make.top.equalTo(self.view).offset(SpaceLevelOne+100);
    }];
    [self.tableviewMultiSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableviewRadioButton.mas_bottom).offset(SpaceLevelOne);
    }];
    [self.collectionViewRadioButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableviewMultiSelectButton.mas_bottom).offset(SpaceLevelOne);
    }];
    [self.collectionViewMultiSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionViewRadioButton.mas_bottom).offset(SpaceLevelOne);
    }];
}

#pragma mark -  Event

- (void)tableviewRadioButtonClick{
    TableviewRadioVC *tableviewRadioVC = [[TableviewRadioVC alloc]init];
    [self.navigationController pushViewController:tableviewRadioVC animated:YES];
}

- (void)tableviewMultiSelectButtonClick{
    TableviewMultiSelectVC *tableviewMultiSelectVC = [[TableviewMultiSelectVC alloc]init];
    [self.navigationController pushViewController:tableviewMultiSelectVC animated:YES];
}

- (void)collectionViewRadioButtonClick{
    CollectionViewRadioVC *collectionViewRadioVC = [[CollectionViewRadioVC alloc]init];
    [self.navigationController pushViewController:collectionViewRadioVC animated:YES];
}

- (void)collectionViewMultiSelectButtonClick{
    CollectionViewMultiSelectVC *collectionViewMultiSelectVC = [[CollectionViewMultiSelectVC alloc]init];
    [self.navigationController pushViewController:collectionViewMultiSelectVC animated:YES];
}

#pragma mark -  UILazy

- (UIButton *)tableviewRadioButton{
    if (!_tableviewRadioButton) {
        _tableviewRadioButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_tableviewRadioButton setTitle:@"tableview 单选" forState:(UIControlStateNormal)];
        [_tableviewRadioButton setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        [_tableviewRadioButton addTarget:self action:@selector(tableviewRadioButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _tableviewRadioButton;
}

- (UIButton *)tableviewMultiSelectButton{
    if (!_tableviewMultiSelectButton) {
        _tableviewMultiSelectButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_tableviewMultiSelectButton setTitle:@"tableview 多选" forState:(UIControlStateNormal)];
        [_tableviewMultiSelectButton setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        [_tableviewMultiSelectButton addTarget:self action:@selector(tableviewMultiSelectButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _tableviewMultiSelectButton;
}


- (UIButton *)collectionViewRadioButton{
    if (!_collectionViewRadioButton) {
        _collectionViewRadioButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_collectionViewRadioButton setTitle:@"collectionView 单选" forState:(UIControlStateNormal)];
        [_collectionViewRadioButton setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        [_collectionViewRadioButton addTarget:self action:@selector(collectionViewRadioButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _collectionViewRadioButton;
}

- (UIButton *)collectionViewMultiSelectButton{
    if (!_collectionViewMultiSelectButton) {
        _collectionViewMultiSelectButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_collectionViewMultiSelectButton setTitle:@"collectionView 多选" forState:(UIControlStateNormal)];
        [_collectionViewMultiSelectButton setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        [_collectionViewMultiSelectButton addTarget:self action:@selector(collectionViewMultiSelectButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _collectionViewMultiSelectButton;
}



@end
