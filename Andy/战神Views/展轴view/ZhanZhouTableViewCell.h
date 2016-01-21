//
//  ZhanZhouTableViewCell.h
//  E展汇
//
//  Created by lingnet on 16/1/8.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZhanZhouModel;
@protocol ZhanZhouTableViewCellDelegate <NSObject>

- (void)guanzhu:(NSInteger)index;

@end
@interface ZhanZhouTableViewCell : UITableViewCell
- (void)configCellWithModel:(ZhanZhouModel *)model;
@property(nonatomic,assign)NSInteger cellIndex;
@property(nonatomic,weak)id<ZhanZhouTableViewCellDelegate>zhanzhouDelegate;
@end
