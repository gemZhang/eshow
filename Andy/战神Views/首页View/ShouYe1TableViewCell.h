//
//  ShouYe1TableViewCell.h
//  E展汇
//
//  Created by lingnet on 16/1/7.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShouYe1TableViewCellDelegate <NSObject>

- (void)zhanzhou;
- (void)zhanhuizhibo;
- (void)huiyi;

@end

@interface ShouYe1TableViewCell : UITableViewCell
@property(nonatomic,weak)id<ShouYe1TableViewCellDelegate>ShouYe1Delegate;
@end
