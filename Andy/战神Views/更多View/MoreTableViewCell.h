//
//  MoreTableViewCell.h
//  E展汇
//
//  Created by lingnet on 16/1/20.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoreModel;
@interface MoreTableViewCell : UITableViewCell
- (void)configCellWithModel:(MoreModel *)model;
@end
