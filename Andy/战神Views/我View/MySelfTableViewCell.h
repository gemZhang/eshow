//
//  MySelfTableViewCell.h
//  E展汇
//
//  Created by lingnet on 16/1/19.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MySelfModel;
@interface MySelfTableViewCell : UITableViewCell
- (void)configCellWithModel:(MySelfModel *)model;
@end
