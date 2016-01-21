//
//  ShouYe2TableViewCell.h
//  E展汇
//
//  Created by lingnet on 16/1/7.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShouYe2Model;
@protocol ShouYe2TableViewCellDelegate <NSObject>

- (void)more:(NSInteger)index;

@end
@interface ShouYe2TableViewCell : UITableViewCell
- (void)configCellWithModel:(ShouYe2Model *)model;
@property(nonatomic,assign)NSInteger cellIndex;
@property(nonatomic,weak)id<ShouYe2TableViewCellDelegate>ShouYe2Delegate;
@end
