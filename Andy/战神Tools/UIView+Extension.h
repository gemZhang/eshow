//
//  UIView+Extension.h
//  过程管理
//
//  Created by iMac on 15/11/23.
//  Copyright (c) 2015年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)//这里一定要这样写代表扩展UIView，当然你也可以去扩展别的东西
//x坐标属性
@property (nonatomic,assign)CGFloat x;
//y坐标
@property (nonatomic,assign)CGFloat y;
//宽度
@property (nonatomic,assign)CGFloat width;
//高度
@property (nonatomic,assign)CGFloat height;
//大小
@property (nonatomic,assign)CGSize size;
//位置
@property (nonatomic,assign)CGPoint origin;
//中心点x
@property (nonatomic,assign)CGFloat centerX;
//中心点y
@property (nonatomic,assign)CGFloat centerY;


@end
