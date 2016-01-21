

//
//  ZhanHuiSection1TableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/20.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ZhanHuiSection1TableViewCell.h"

@interface ZhanHuiSection1TableViewCell()
@property (nonatomic, strong) UIView* linwView;
@end

@implementation ZhanHuiSection1TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    self.backgroundColor = [UIColor greenColor];
    
    self.linwView = [[UIView alloc] init];
    [self.contentView addSubview:self.linwView];
    self.linwView.backgroundColor = [UIColor redColor];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.mas_bottom).offset(-0.5);
    }];
    
    NSArray* titArr = [[NSArray alloc] initWithObjects:@"新闻中心",@"活动日程",@"高峰论坛",@"展会服务",@"新品推荐",@"展商", nil];
    for (int i = 0; i < 6; i++) {
        UIImageView* topIV = [MyController createImageViewWithFrame:CGRectMake(([MyController getScreenWidth] - 43 * 6) / 7 * ( i + 1 ) + (43 * i), 15, 44, 44) ImageName:nil];
        topIV.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:topIV];
        
        UILabel* botLable = [MyController createLabelWithFrame:CGRectMake(([MyController getScreenWidth] - 43 * 6) / 7 * ( i + 1 ) + (43 * i), 62, 43, 12) Font:10 Text:titArr[i]];
        botLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:botLable];
    }
    // 必须加上这句
//    self.hyb_lastViewInCell = self.linwView;
//    self.hyb_bottomOffsetToCell = 0;
    
}


@end
