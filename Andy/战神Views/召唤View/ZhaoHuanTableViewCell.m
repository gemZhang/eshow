

//
//  ZhaoHuanTableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/13.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ZhaoHuanTableViewCell.h"

#import "ZhaoHuanModel.h"

@interface ZhaoHuanTableViewCell()
@property (nonatomic, strong) UIView* lineView;
@property (nonatomic, strong) UIImageView* headIV;
@property (nonatomic, strong) UILabel* titleLable;
@property (nonatomic, strong) UIImageView* disIV;
@property (nonatomic, strong) UILabel* disLable;
@property (nonatomic, strong) UILabel* neirongLable;
@property (nonatomic, strong) UILabel* timeLable;
@property (nonatomic, strong) UIView* bottomView;
@property (nonatomic, strong) UIImageView* sv1;
@property (nonatomic, strong) UIImageView* sv2;

@property (nonatomic, strong) UIView* shulineView;
@property (nonatomic, strong) UILabel* statusLable;
@property (nonatomic, strong) UILabel* yearLable;
@property (nonatomic, strong) UILabel* monthLable;
@end

@implementation ZhaoHuanTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    self.lineView = [[UIView alloc] init];
    [self.contentView addSubview:self.lineView];
    self.lineView.backgroundColor = [MyController colorWithHexString:@"f6f6f6"];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset(7);
    }];
    
    self.headIV = [[UIImageView alloc] init];
    self.headIV.layer.cornerRadius = 20;
    self.headIV.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headIV];
    self.headIV.backgroundColor = [UIColor redColor];
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(12);
        make.width.mas_offset(40);
        make.height.mas_offset(40);
    }];
    
    self.titleLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLable];
    self.titleLable.numberOfLines = 1;
    self.titleLable.textAlignment = NSTextAlignmentLeft;
    self.titleLable.font = [UIFont systemFontOfSize:12];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_right).offset(15);
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(20);
        make.right.mas_equalTo(-100);
        make.height.mas_offset(12);
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
        make.right.mas_equalTo(-100);
        make.height.mas_offset(10);
    }];
    
    self.neirongLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.neirongLable];
    self.neirongLable.numberOfLines = 0;
    self.neirongLable.textAlignment = NSTextAlignmentLeft;
    self.neirongLable.font = [UIFont systemFontOfSize:14];
    
    [self.neirongLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLable);
        make.top.mas_equalTo(self.disLable.mas_bottom).offset(10);
        make.right.mas_equalTo(-100);
        make.height.mas_offset(14);
    }];
    
    self.timeLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.timeLable];
    self.timeLable.numberOfLines = 1;
    self.timeLable.textAlignment = NSTextAlignmentLeft;
    self.timeLable.font = [UIFont systemFontOfSize:14];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLable.mas_top).offset(5);
        make.right.mas_equalTo(-10);
        make.height.mas_offset(10);
    }];
    
    self.bottomView = [[UIView alloc] init];
    [self.contentView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLable);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.neirongLable.mas_bottom).offset(16);
        make.height.mas_offset(156/2);
    }];

    int padding1 = 10;
    
    self.sv1 = [[UIImageView alloc] init];
    [self.sv1 setContentMode:UIViewContentModeScaleAspectFill];
    self.sv1.clipsToBounds = YES;
    [self.contentView addSubview:self.sv1];
    
    self.sv2 = [[UIImageView alloc] init];
    [self.sv2 setContentMode:UIViewContentModeScaleAspectFill];
    self.sv2.clipsToBounds = YES;
    [self.contentView addSubview:self.sv2];
    
    [self.sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomView.mas_centerY);
        make.left.equalTo(self.bottomView.mas_left).with.offset(0);
        make.right.equalTo(self.sv2.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(self.bottomView);
        make.width.equalTo(self.sv2);
    }];
    
    [self.sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomView.mas_centerY);
        make.left.equalTo(self.sv1.mas_right).with.offset(padding1);
        make.right.equalTo(self.bottomView.mas_right).with.offset(0);
        make.height.mas_equalTo(self.bottomView);
        make.width.equalTo(self.sv1);
    }];
    
    self.shulineView = [[UIView alloc] init];
    [self.contentView addSubview:self.shulineView];
    self.shulineView.backgroundColor = [UIColor blackColor];//[MyController colorWithHexString:@"f6f6f6"];
    self.shulineView.alpha = 0.3;
    [self.shulineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_left).offset(20 - 0.25);
        make.top.mas_equalTo(self.headIV.mas_bottom);
        make.bottom.mas_equalTo(self.bottomView.mas_top).offset(45);
        make.width.mas_offset(1);
    }];
    
    self.statusLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.statusLable];
    self.statusLable.numberOfLines = 1;
    self.statusLable.backgroundColor = [UIColor blackColor];
    self.statusLable.textColor = [UIColor whiteColor];
    self.statusLable.textAlignment = NSTextAlignmentCenter;
    self.statusLable.font = [UIFont systemFontOfSize:12];
    
    [self.statusLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shulineView.mas_top).offset(12);
        make.left.mas_equalTo(self.shulineView.mas_left).offset(-20);
        make.height.mas_offset(18);
        make.width.mas_offset(40);
    }];
    
    self.yearLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.yearLable];
    self.yearLable.numberOfLines = 1;
    self.yearLable.textAlignment = NSTextAlignmentCenter;
    self.yearLable.font = [UIFont systemFontOfSize:14];
    
    [self.yearLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shulineView.mas_bottom).offset(6);
        make.left.mas_equalTo(self.shulineView.mas_left).offset(-20);
        make.height.mas_offset(14);
        make.width.mas_offset(40);
    }];
    
    self.monthLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.monthLable];
    self.monthLable.numberOfLines = 1;
    self.monthLable.textAlignment = NSTextAlignmentCenter;
    self.monthLable.textColor = [MyController colorWithHexString:@"c2c2c2"];
    self.monthLable.font = [UIFont systemFontOfSize:12];
    
    [self.monthLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yearLable.mas_bottom).offset(6);
        make.left.mas_equalTo(self.shulineView.mas_left).offset(-20);
        make.height.mas_offset(12);
        make.width.mas_offset(40);
    }];
    
    // 必须加上这句
    self.hyb_lastViewInCell = self.bottomView;
    self.hyb_bottomOffsetToCell = 28;
}
- (void)configCellWithModel:(ZhaoHuanModel *)model{
    [self.headIV sd_setImageWithURL:[NSURL URLWithString:model.headImageStr] placeholderImage:[UIImage imageNamed:@"meinv.jpg"]];
    
    self.titleLable.text = model.titleStr;
    
    self.disLable.text = model.distanceStr;
    
    self.neirongLable.text = model.neirongStr;
    [MyController fuwenbenLabel:self.neirongLable FontNumber:[UIFont systemFontOfSize:12] AndRange:NSMakeRange(5, self.neirongLable.text.length - 5) AndColor:[MyController colorWithHexString:@"c2c2c2"]];
    
    NSLog(@"传过来的图片数组----%@",model.imageArr);
    [self.sv1 sd_setImageWithURL:[NSURL URLWithString:model.imageArr[0]] placeholderImage:[UIImage imageNamed:@"meinv.jpg"]];
    
    [self.sv2 sd_setImageWithURL:[NSURL URLWithString:model.imageArr[1]] placeholderImage:[UIImage imageNamed:@"meinv.jpg"]];
    
    self.statusLable.text = model.statusStr;
    
    self.yearLable.text = model.yearStr;
    
    self.monthLable.text = model.monthStr;
    
    self.timeLable.text = model.timeStr;
}
@end
