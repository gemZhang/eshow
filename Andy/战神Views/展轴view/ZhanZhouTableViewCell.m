

//
//  ZhanZhouTableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/8.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ZhanZhouTableViewCell.h"

#import "ZhanZhouModel.h"

@interface ZhanZhouTableViewCell()
@property (nonatomic, strong) UIView* bgView;
@property (nonatomic, strong) UIImageView* topIV;
@property (nonatomic, strong) UILabel* titleLable;
@property (nonatomic, strong) UIImageView* headIV;

@property (nonatomic, strong) UIImageView* lineIV0;
@property (nonatomic, strong) UIImageView* lineIV2;
@property (nonatomic, strong) UIImageView* dianIV;

@property (nonatomic, strong) UILabel* timeLable;

@end
@implementation ZhanZhouTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    
    self.lineIV0 = [[UIImageView alloc] init];
    self.lineIV0.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.lineIV0];
    [self.lineIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(34);
        make.top.mas_equalTo(0);
        make.width.mas_offset(2);
        make.height.mas_offset(20);
    }];

    self.headIV = [[UIImageView alloc] init];
    self.headIV.backgroundColor = [UIColor redColor];
    //将图层的边框设置为圆脚
    self.headIV.layer.cornerRadius = 25;
    self.headIV.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headIV];
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(20);
        make.width.mas_offset(50);
        make.height.mas_offset(50);
    }];

    self.lineIV2 = [[UIImageView alloc] init];
    self.lineIV2.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.lineIV2];
    [self.lineIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(34);
        make.top.mas_equalTo(self.headIV.mas_bottom);
        make.width.mas_offset(2);
        make.bottom.mas_equalTo(self);
    }];

    self.dianIV = [[UIImageView alloc] init];
    self.dianIV.image = [UIImage imageNamed:@"dian"];
    [self.contentView addSubview:self.dianIV];
    [self.dianIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(28);
        make.top.mas_equalTo(self.headIV.mas_bottom).offset(20);
        make.width.mas_offset(14);
        make.height.mas_offset(14);
    }];
    
    self.timeLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.timeLable];
    self.timeLable.numberOfLines = 1;
    self.timeLable.textColor = [MyController colorWithHexString:@"f0706f"];
    self.timeLable.font = [UIFont systemFontOfSize:12];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dianIV.mas_left).offset(20);
        make.top.mas_equalTo(self.dianIV);
        make.width.mas_equalTo(40);
        make.height.mas_offset(12);
    }];

    self.bgView = [[UIView alloc] init];
    //将图层的边框设置为圆脚
    self.bgView.layer.cornerRadius = 6;
    self.bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.bgView];
    self.bgView.backgroundColor = [MyController colorWithHexString:@"f14545"];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(90);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(10);
    }];
    
    self.topIV = [[UIImageView alloc] init];
    [self.bgView addSubview:self.topIV];
    [self.topIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(self.bgView);
    }];
    
    self.titleLable = [[UILabel alloc] init];
    [self.bgView addSubview:self.titleLable];
    self.titleLable.numberOfLines = 1;
    self.titleLable.font = [UIFont systemFontOfSize:14];
    self.titleLable.textColor = [UIColor whiteColor];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.top.mas_equalTo(self.topIV.mas_bottom).offset(5);
        make.width.mas_equalTo(self.topIV);
        make.height.mas_offset(14);
    }];
    
    // 必须加上这句
    self.hyb_lastViewInCell = self.bgView;
    self.hyb_bottomOffsetToCell = 20;
}
- (void)configCellWithModel:(ZhanZhouModel *)model{

    [self.headIV sd_setImageWithURL:[NSURL URLWithString:@"http://lol.qovan.com/Upload/Skins/Teemo/70c865af4c4543be999340957ec9f5c9.jpg"] placeholderImage:[UIImage imageNamed:@""]];
    
    self.timeLable.text = @"12.12";
    
    if (model.topImageStr > 0) {
        [self.topIV sd_setImageWithURL:[NSURL URLWithString:model.topImageStr] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
        CGFloat scale = self.topIV.image.size.height / self.topIV.image.size.width;
//        NSLog(@"------比例是---%.2f",scale);

        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(90);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(10);
            make.height.mas_offset(([MyController getScreenWidth] - 110) * scale + 30);
        }];
        
        [self.topIV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(self.bgView);
            make.height.mas_offset(([MyController getScreenWidth] - 110) * scale);
        }];
        
    }else{
        
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(90);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(10);
            make.height.mas_offset(30);
        }];
        
        [self.topIV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(self.bgView);
            make.height.mas_offset(0);
        }];
        
    }
    self.titleLable.text = model.titleStr;
    
}
- (void)guanzhubtnClick{
    
}

@end
