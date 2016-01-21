//
//  ZhaoHuanModel.h
//  E展汇
//
//  Created by lingnet on 16/1/13.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhaoHuanModel : NSObject
@property(nonatomic,copy)NSString* headImageStr;
@property(nonatomic,assign)NSInteger isXiangying;
@property(nonatomic,copy)NSString* titleStr;
@property(nonatomic,copy)NSString* distanceStr;
@property(nonatomic,copy)NSString* neirongStr;
@property(nonatomic,copy)NSString* timeStr;
@property(nonatomic,copy)NSString* statusStr;
@property(nonatomic,copy)NSString* yearStr;
@property(nonatomic,copy)NSString* monthStr;
@property(nonatomic,retain)NSMutableArray* imageArr;
@end
