
//
//  FaXianTableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/13.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "FaXianTableViewCell.h"

#import "FaxianModel.h"

@interface FaXianTableViewCell()
@property (nonatomic, strong) UIView* bgView;
@property (nonatomic, strong) UIImageView* leftIV;
@property (nonatomic, strong) UILabel* titleLable;
@property (nonatomic, strong) UIImageView* rightIV;
@end

@implementation FaXianTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    self.bgView = [[UIView alloc] init];
    [self.contentView addSubview:self.bgView];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(5);
        make.height.mas_offset(40);
    }];
    
    self.leftIV = [[UIImageView alloc] init];
    [self.bgView addSubview:self.leftIV];
    self.leftIV.backgroundColor = [UIColor redColor];
    [self.leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(15);
        make.width.mas_offset(13);
        make.height.mas_offset(13);
    }];
    
    self.titleLable = [[UILabel alloc] init];
    [self.bgView addSubview:self.titleLable];
    self.titleLable.numberOfLines = 1;
    self.titleLable.textAlignment = NSTextAlignmentLeft;
    self.titleLable.font = [UIFont systemFontOfSize:14];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftIV.mas_right).offset(11);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(80);
        make.bottom.mas_equalTo(0);
    }];
    
    self.rightIV = [[UIImageView alloc] init];
    self.rightIV.backgroundColor = [UIColor redColor];
    [self.bgView addSubview:self.rightIV];
    [self.rightIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-7.5);
        make.top.mas_equalTo(11);
        make.width.mas_offset(20);
        make.height.mas_offset(20);
    }];
    
    // 必须加上这句
    self.hyb_lastViewInCell = self.bgView;
    self.hyb_bottomOffsetToCell = 0;
}
- (void)configCellWithModel:(FaxianModel *)model{
    self.leftIV.image = [UIImage imageNamed:model.leftImageStr];
    
    self.titleLable.text = model.titleStr;
}

@end
