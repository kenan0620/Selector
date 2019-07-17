//
//  SelectCollectionViewCell.m
//  Selector
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import "SelectCollectionViewCell.h"

#import "SelectModel.h"

@interface SelectCollectionViewCell ()
///姓名
@property (nonatomic, readwrite, strong) UILabel *nameLabel;
@end

@implementation SelectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(SpaceLevelOne, SpaceLevelOne, SpaceLevelOne, SpaceLevelOne));
        }];
    }
    return self;
}

#pragma mark -  set

- (void)setModel:(SelectModel *)model{
    _model = model;
    self.nameLabel.text = _model.nameStr;
    if (_model.isSelected) {
        self.nameLabel.textColor = [UIColor brownColor];
    }else{
        self.nameLabel.textColor = [UIColor lightGrayColor];
    }
}

#pragma mark -  UILazy

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
    }
    return _nameLabel;
}
@end
