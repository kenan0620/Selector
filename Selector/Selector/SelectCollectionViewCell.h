//
//  SelectCollectionViewCell.h
//  Selector
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectModel;

NS_ASSUME_NONNULL_BEGIN

@interface SelectCollectionViewCell : UICollectionViewCell

@property (nonatomic, readwrite, strong) SelectModel *model;

@end

NS_ASSUME_NONNULL_END
