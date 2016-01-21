
//
//  ZhanHuiSection2TableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/20.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ZhanHuiSection2TableViewCell.h"

#import "ZhanHuiSection2Model.h"

@interface ZhanHuiSection2TableViewCell()
@property (nonatomic, strong) UIScrollView* sv;

@property (nonatomic, strong) UIImageView* headIV;
@property (nonatomic, strong) UIImageView* liuyanIV;
@property (nonatomic, strong) UIImageView* numIV;

@property (nonatomic, strong) UILabel* nameLable;
@property (nonatomic, strong) UILabel* liuyanLable;
@property (nonatomic, strong) UILabel* timeLable;
@property (nonatomic, strong) UILabel* numLable;

@property (nonatomic, strong) UIButton* replyBtn;
@end
@implementation ZhanHuiSection2TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    
}
- (void)configCellWithModel:(ZhanHuiSection2Model *)model{
    
}

@end
