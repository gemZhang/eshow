

//
//  ShouYe2TableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/7.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ShouYe2TableViewCell.h"

#import "ShouYe2Model.h"

@interface ShouYe2TableViewCell()
@property (nonatomic, strong) UIView* bgView;
@property (nonatomic, strong) UIImageView* TopIV;
@property (nonatomic, strong) UILabel* TopLable;
@property (nonatomic, strong) UIImageView* temIV;
@property (nonatomic, strong) UIButton* moreBtn;

@end
@implementation ShouYe2TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    //将图层的边框设置为圆脚
    self.bgView.layer.cornerRadius = 6;
    self.bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(4);
        make.top.mas_equalTo(7);
        make.height.mas_offset(([MyController getScreenWidth] - 8)* 38/69);
        make.width.mas_offset([MyController getScreenWidth] - 8);
    }];
    
    self.TopIV = [[UIImageView alloc] init];
    self.TopIV.layer.cornerRadius = 18;
    self.TopIV.layer.masksToBounds = YES;
    self.TopIV.backgroundColor = [UIColor redColor];
    [self.bgView addSubview:self.TopIV];
    [self.TopIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(6);
        make.top.mas_equalTo(6);
        make.height.mas_offset(36);
        make.width.mas_offset(36);
    }];
    
    self.TopLable = [[UILabel alloc] init];
    [self.bgView addSubview:self.TopLable];
    self.TopLable.numberOfLines = 1;
    self.TopLable.font = [UIFont systemFontOfSize:14];
    
    [self.TopLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.TopIV.mas_right).offset(5);
        make.top.mas_equalTo(self.TopIV);
        make.right.mas_equalTo(-40);
        make.height.mas_offset(36);
    }];
    
    self.moreBtn = [MyController createButtonWithFrame:self.frame ImageName:nil Target:self Action:@selector(moreBtnClick) Title:nil];
    [self.bgView addSubview:self.moreBtn];
    self.moreBtn.backgroundColor = [UIColor redColor];
    self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.TopLable);
        make.width.mas_equalTo(40);
        make.height.mas_offset(35);
    }];
    
    self.temIV = [[UIImageView alloc] init];
    [self.temIV setContentMode:UIViewContentModeScaleAspectFill];
    self.temIV.clipsToBounds = YES;
    [self.bgView addSubview:self.temIV];
    [self.temIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(6);
        make.right.mas_equalTo(-6);
        make.top.mas_equalTo(self.TopIV.mas_bottom).offset(5);
        make.height.mas_offset(([MyController getScreenWidth] - 20) * 272/685);
    }];
    
    // 必须加上这句
    self.hyb_lastViewInCell = self.bgView;
    self.hyb_bottomOffsetToCell = 0;
}
- (void)configCellWithModel:(ShouYe2Model *)model{
    self.TopIV.image = [UIImage imageNamed:@""];
    
    self.TopLable.text = model.leftTitleStr;
    
    [self.temIV sd_setImageWithURL:[NSURL URLWithString:model.conterImageStr] placeholderImage:[UIImage imageNamed:@"meinv.jpg"]];
}
- (void)moreBtnClick{
    [self.ShouYe2Delegate more:self.cellIndex];
}
@end
