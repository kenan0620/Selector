//
//  SelectModel.h
//  Selector
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 侯克楠. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectModel : NSObject
///名称
@property (nonatomic, strong) NSString *nameStr;
///是否选中
@property (nonatomic, assign) BOOL isSelected;
@end

NS_ASSUME_NONNULL_END
