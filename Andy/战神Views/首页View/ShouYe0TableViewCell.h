//
//  ShouYe0TableViewCell.h
//  E展汇
//
//  Created by lingnet on 16/1/7.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShouYe0Model;

@protocol ShouYe0TableViewCellDelegate <NSObject>

- (void)didselectADPic:(NSInteger)index;

@end
@interface ShouYe0TableViewCell : UITableViewCell
@property(nonatomic,weak)id<ShouYe0TableViewCellDelegate>ShouYe0Delegate;
- (void)configCellWithModel:(ShouYe0Model *)model;

@end
