

//
//  ZhaoHuanDetailTableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/19.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ZhaoHuanDetailTableViewCell.h"

#import "ZhaoHuanDetailModel.h"

@interface ZhaoHuanDetailTableViewCell()

@property (nonatomic, strong) UIImageView* headIV;
@property (nonatomic, strong) UIImageView* disIV;
@property (nonatomic, strong) UIImageView* timeIV;

@property (nonatomic, strong) UILabel* titleLable;
@property (nonatomic, strong) UILabel* disLable;
@property (nonatomic, strong) UILabel* timeLable;

@property (nonatomic, strong) UIButton* lianxiBtn;

@property (nonatomic, strong) UIView* lineView;
@end

@implementation ZhaoHuanDetailTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    self.backgroundColor = [UIColor whiteColor];
    
    self.headIV = [[UIImageView alloc] init];
    [self.headIV setContentMode:UIViewContentModeScaleAspectFill];
    self.headIV.clipsToBounds = YES;
    self.headIV.layer.cornerRadius = 20;
    self.headIV.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headIV];
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.width.mas_offset(40);
        make.height.mas_offset(40);
    }];
    
    self.titleLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLable];
    self.titleLable.numberOfLines = 1;
    self.titleLable.textAlignment = NSTextAlignmentLeft;
    self.titleLable.font = [UIFont systemFontOfSize:14];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_right).offset(15);
        make.top.mas_equalTo(15);
        make.right.mas_equalTo(-65);
        make.height.mas_offset(14);
    }];
    
    self.disIV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.disIV];
    self.disIV.backgroundColor = [UIColor redColor];
    [self.disIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLable);
        make.top.mas_equalTo(self.titleLable.mas_bottom).offset(7);
        make.width.mas_offset(10);
        make.height.mas_offset(10);
    }];
    
    self.disLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.disLable];
    self.disLable.numberOfLines = 1;
    self.disLable.textAlignment = NSTextAlignmentLeft;
    self.disLable.font = [UIFont systemFontOfSize:10];
    
    [self.disLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.disIV.mas_right).offset(5);
        make.top.mas_equalTo(self.disIV);
        make.width.mas_offset(65/2);
        make.height.mas_offset(10);
    }];
    
    self.timeIV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.timeIV];
    self.timeIV.backgroundColor = [UIColor redColor];
    [self.timeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.disLable.mas_right).offset(5);
        make.top.mas_equalTo(self.disLable);
        make.width.mas_offset(10);
        make.height.mas_offset(10);
    }];
    
    self.timeLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.timeLable];
    self.timeLable.numberOfLines = 1;
    self.timeLable.textAlignment = NSTextAlignmentLeft;
    self.timeLable.font = [UIFont systemFontOfSize:10];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeIV.mas_right).offset(5);
        make.top.mas_equalTo(self.disIV);
        make.width.mas_offset(66);
        make.height.mas_offset(10);
    }];
    
    self.lianxiBtn = [MyController createButtonWithFrame:self.frame ImageName:@"" Target:self Action:@selector(lianxiBtnClick) Title:@"联系"];
    [self.lianxiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.lianxiBtn setBackgroundColor:[UIColor blackColor]];
    self.lianxiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.lianxiBtn];
    
    [self.lianxiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-9);
        make.top.mas_equalTo(22);
        make.width.mas_offset(56);
        make.height.mas_offset(20);
    }];
    
    self.lineView = [[UIView alloc] init];
    [self.contentView addSubview:self.lineView];
    self.lineView.backgroundColor = [MyController colorWithHexString:@"d8d8d8"];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.disIV.mas_bottom).offset(15);
        make.height.mas_equalTo(0.5);
    }];
    // 必须加上这句
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;

}
- (void)lianxiBtnClick{
    [self.lianxiDelegate lianxi:self.cellIndex];
}
- (void)configCellWithModel:(ZhaoHuanDetailModel *)model{
    [self.headIV sd_setImageWithURL:[NSURL URLWithString:model.headImageStr] placeholderImage:[UIImage imageNamed:@"meinv.jpg"]];
    
    self.titleLable.text = model.titleStr;
    
    self.disLable.text = model.distanceStr;
    
    self.timeLable.text = model.timeStr;
}
@end
