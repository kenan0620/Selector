//
//  CustomTableViewCell.m
//  Selector
//
//  Created by mac on 2019/7/17.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import "CustomTableViewCell.h"

#import "SelectModel.h"

@interface CustomTableViewCell ()
///姓名
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(SpaceLevelOne, SpaceLevelOne, SpaceLevelOne, 0));
        }];
    }
    return self;
}

- (void)setSelectModel:(SelectModel *)selectModel{
    _selectModel = selectModel;
    self.nameLabel.text = _selectModel.nameStr;
    #pragma mark -  第一二种方法实现
//    if (_selectModel.isSelected) {
//        self.nameLabel.textColor = [UIColor brownColor];
//    }else{
//        self.nameLabel.textColor = [UIColor lightGrayColor];
//    }
}

#pragma mark -  UILazy
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
    }
    return _nameLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    //第三种方法实现
    if (selected) {
        self.nameLabel.textColor = [UIColor brownColor];
    }else{
        self.nameLabel.textColor = [UIColor lightGrayColor];
    }
}

@end
