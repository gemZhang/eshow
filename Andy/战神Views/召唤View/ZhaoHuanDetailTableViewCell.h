//
//  ZhaoHuanDetailTableViewCell.h
//  E展汇
//
//  Created by lingnet on 16/1/19.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZhaoHuanDetailModel;
@protocol ZhaoHuanDetailTableViewCellDeleagte <NSObject>

- (void)lianxi:(NSInteger)index;

@end
@interface ZhaoHuanDetailTableViewCell : UITableViewCell
- (void)configCellWithModel:(ZhaoHuanDetailModel *)model;
@property(nonatomic,assign)NSInteger cellIndex;
@property(nonatomic,weak)id<ZhaoHuanDetailTableViewCellDeleagte>lianxiDelegate;
@end
