//
//  CustomTableViewCell.h
//  Selector
//
//  Created by mac on 2019/7/17.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelectModel;
NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell
@property (nonatomic, strong) SelectModel *selectModel;
@end

NS_ASSUME_NONNULL_END
