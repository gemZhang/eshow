//
//  MySelfSection0TableViewCell.h
//  E展汇
//
//  Created by lingnet on 16/1/19.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MySelfSection0Model;

@protocol MySelfSection0TableViewCellDeleagte <NSObject>

- (void)hongbao;
- (void)xiaoxi;
- (void)guanzhu;
- (void)gengduo;

@end

@interface MySelfSection0TableViewCell : UITableViewCell

- (void)configCellWithModel:(MySelfSection0Model *)model;

@property(nonatomic,weak)id<MySelfSection0TableViewCellDeleagte>myselfDelegate;

@end
