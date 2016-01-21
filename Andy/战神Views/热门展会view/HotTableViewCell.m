


//
//  HotTableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/7.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "HotTableViewCell.h"

#import "HotModel.h"

@interface HotTableViewCell()
@property (nonatomic, strong) UIView* bgView;
@property (nonatomic, strong) UILabel* desLable;
@property (nonatomic, strong) UIImageView* temIV;
@property (nonatomic, strong) UIImageView* timeIV;
@property (nonatomic, strong) UILabel* timeLable;
@property (nonatomic, strong) UIImageView* guanzhuIV;
@property (nonatomic, strong) UILabel* guanzhuLable;
@property (nonatomic, strong) UIButton* guanzhubtn;

@end
@implementation HotTableViewCell

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
        make.top.mas_equalTo(5);
        make.height.mas_offset(([MyController getScreenWidth] - 8)* 350/710);
        make.width.mas_offset([MyController getScreenWidth] - 8);
    }];
    
    self.temIV = [[UIImageView alloc] init];
    [self.temIV setContentMode:UIViewContentModeScaleAspectFill];
    self.temIV.clipsToBounds = YES;
    [self.bgView addSubview:self.temIV];
    [self.temIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset(([MyController getScreenWidth] - 8) * 277/710);
    }];
    
    self.desLable = [[UILabel alloc] init];
    self.desLable.backgroundColor = [UIColor redColor];
    self.desLable.font = [UIFont systemFontOfSize:14];
    self.desLable.numberOfLines = 1;
    [self.bgView addSubview:self.desLable];
    [self.desLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-100);
        make.top.mas_equalTo(self.temIV.mas_bottom).offset(12);
        make.height.mas_offset(14);
    }];
    
    self.timeIV = [[UIImageView alloc] init];
    self.timeIV.backgroundColor = [UIColor greenColor];
    [self.bgView addSubview:self.timeIV];
    [self.timeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([MyController getScreenWidth] - 190/2);
        make.top.mas_equalTo(self.temIV.mas_bottom).offset(15);
        make.height.mas_offset(10);
        make.width.mas_offset(10);
    }];
    
    self.timeLable = [[UILabel alloc] init];
    self.timeLable.backgroundColor = [UIColor yellowColor];
    self.timeLable.font = [UIFont systemFontOfSize:10];
    self.timeLable.numberOfLines = 1;
    [self.bgView addSubview:self.timeLable];
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeIV).offset(12);
        make.top.mas_equalTo(self.timeIV);
        make.height.mas_offset(10);
        make.width.mas_offset(62/2);
    }];
    
    self.guanzhuIV = [[UIImageView alloc] init];
    self.guanzhuIV.backgroundColor = [UIColor blackColor];
    [self.bgView addSubview:self.guanzhuIV];
    [self.guanzhuIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeLable).offset(62/2 + 3);
        make.top.mas_equalTo(self.timeLable);
        make.height.mas_equalTo(self.timeIV);
        make.width.mas_equalTo(self.timeIV);
    }];
    
    self.guanzhuLable = [[UILabel alloc] init];
    self.guanzhuLable.backgroundColor = [UIColor orangeColor];
    self.guanzhuLable.font = [UIFont systemFontOfSize:10];
    self.guanzhuLable.numberOfLines = 1;
    [self.bgView addSubview:self.guanzhuLable];
    [self.guanzhuLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.guanzhuIV).offset(10 + 3);
        make.top.mas_equalTo(self.guanzhuIV);
        make.height.mas_offset(10);
        make.width.mas_offset(72/2);
    }];
    
    self.guanzhubtn = [MyController createButtonWithFrame:self.frame ImageName:nil Target:self Action:@selector(guanzhubtnClick) Title:nil];
    [self.bgView addSubview:self.guanzhubtn];
//    self.guanzhubtn.backgroundColor = [UIColor redColor];
    
    [self.guanzhubtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.guanzhuIV);
        make.top.mas_equalTo(self.guanzhuIV).offset(-5);
        make.width.mas_equalTo(40);
        make.height.mas_offset(20);
    }];
    
    // 必须加上这句
    self.hyb_lastViewInCell = self.bgView;
    self.hyb_bottomOffsetToCell = 0;
}
- (void)configCellWithModel:(HotModel *)model{
    [self.temIV sd_setImageWithURL:[NSURL URLWithString:model.topImageStr] placeholderImage:[UIImage imageNamed:@"meinv.jpg"]];
    
    self.desLable.text = model.desStr;
    
    self.timeLable.text = model.timeStr;
    
    self.guanzhuLable.text = model.guanzhuStr;
}
- (void)guanzhubtnClick{
    
    [self.hotDelegate guanzhu:self.cellIndex];
}
@end
