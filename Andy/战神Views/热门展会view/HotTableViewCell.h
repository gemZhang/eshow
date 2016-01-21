//
//  HotTableViewCell.h
//  E展汇
//
//  Created by lingnet on 16/1/7.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HotModel;
@protocol HotTableViewCellDelegate <NSObject>

- (void)guanzhu:(NSInteger)index;

@end
@interface HotTableViewCell : UITableViewCell
- (void)configCellWithModel:(HotModel *)model;
@property(nonatomic,assign)NSInteger cellIndex;
@property(nonatomic,weak)id<HotTableViewCellDelegate>hotDelegate;
@end
