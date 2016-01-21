

//
//  MySelfTableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/19.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "MySelfTableViewCell.h"

#import "MySelfModel.h"

@interface MySelfTableViewCell()
@property (nonatomic, strong) UIView* lineView;
@property (nonatomic, strong) UIImageView* leftHeadIV;
@property (nonatomic, strong) UILabel* titleLable;
@end
@implementation MySelfTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    self.backgroundColor = [UIColor whiteColor];
    
    self.leftHeadIV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.leftHeadIV];
    self.leftHeadIV.backgroundColor = [UIColor redColor];
    [self.leftHeadIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.top.mas_equalTo(15);
        make.width.mas_offset(16);
        make.height.mas_offset(16);
    }];
    
    self.titleLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLable];
    self.titleLable.numberOfLines = 1;
    self.titleLable.textAlignment = NSTextAlignmentLeft;
    self.titleLable.font = [UIFont systemFontOfSize:14];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftHeadIV.mas_right).offset(9);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.height.mas_offset(45);
    }];
    
    self.lineView = [[UIView alloc] init];
    [self.contentView addSubview:self.lineView];
    self.lineView.backgroundColor = [MyController colorWithHexString:@"d8d8d8"];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.titleLable.mas_bottom);
        make.height.mas_equalTo(0.5);
    }];
    // 必须加上这句
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}
- (void)configCellWithModel:(MySelfModel *)model{
    self.leftHeadIV.image = [UIImage imageNamed:model.leftImageStr];
    
    self.titleLable.text = model.titleStr;
}

@end
