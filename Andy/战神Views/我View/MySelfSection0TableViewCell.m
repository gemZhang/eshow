
//
//  MySelfSection0TableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/19.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "MySelfSection0TableViewCell.h"

#import "MySelfSection0Model.h"

@interface MySelfSection0TableViewCell()

@property (nonatomic, strong) UIImageView* headIV;

@property (nonatomic, strong) UILabel* nameLable;

@property (nonatomic, strong) UIButton* moreBtn;

@property (nonatomic, strong) UIImageView* bgImageView;
@property (nonatomic, strong) UIView* bottomView;
@end
@implementation MySelfSection0TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    self.bgImageView = [[UIImageView alloc] init];
    [self.bgImageView setContentMode:UIViewContentModeScaleAspectFill];
    self.bgImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.bgImageView];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    self.headIV = [[UIImageView alloc] init];
    [self.headIV setContentMode:UIViewContentModeScaleAspectFill];
    self.headIV.clipsToBounds = YES;
    self.headIV.layer.cornerRadius = 35;
    self.headIV.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headIV];
    self.headIV.backgroundColor = [UIColor redColor];
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([MyController getScreenWidth]/2 - 35);
        make.top.mas_equalTo(34);
        make.width.mas_offset(70);
        make.height.mas_offset(70);
    }];
    
    self.nameLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLable];
    self.nameLable.numberOfLines = 1;
    self.nameLable.textAlignment = NSTextAlignmentCenter;
    self.nameLable.font = [UIFont systemFontOfSize:14];
    
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.top.mas_equalTo(self.headIV.mas_bottom).offset(12);
        make.right.mas_equalTo(-5);
        make.height.mas_offset(14);
    }];
    
    self.bottomView = [[UIView alloc] init];
    self.bottomView.backgroundColor = [UIColor blackColor];
    self.bottomView.alpha = 0.4;
    [self.contentView addSubview:self.bottomView];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.nameLable.mas_bottom).offset(20);
        make.height.mas_equalTo(38);
    }];
    
    NSArray* titleArr = [[NSArray alloc] initWithObjects:@"红包",@"消息",@"关注", nil];
    for (int i = 0; i < 3; i++) {
        UIButton* temBtn = [MyController createButtonWithFrame:CGRectMake([MyController getScreenWidth] / 3 * i, 0, [MyController getScreenWidth] / 3, 38) ImageName:nil Target:self Action:@selector(temBtnClick:) Title:titleArr[i]];
        temBtn.tag = 100 + i;
        [temBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        temBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.bottomView addSubview:temBtn];
    }
    
    self.moreBtn = [MyController createButtonWithFrame:self.frame ImageName:@"" Target:self Action:@selector(moreBtnClick) Title:nil];
    [self.moreBtn setBackgroundColor:[UIColor blackColor]];
    [self.contentView addSubview:self.moreBtn];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(18);
        make.width.mas_offset(30);
        make.height.mas_offset(20);
    }];
    
    // 必须加上这句
    self.hyb_lastViewInCell = self.bottomView;
    self.hyb_bottomOffsetToCell = 0;
}
- (void)moreBtnClick{
    [self.myselfDelegate gengduo];
}
- (void)temBtnClick:(UIButton*)btn{
    if (100 == btn.tag) {
        [self.myselfDelegate hongbao];
    }else if (101 == btn.tag){
        [self.myselfDelegate xiaoxi];
    }else if (102 == btn.tag){
        [self.myselfDelegate guanzhu];
    }
}
- (void)configCellWithModel:(MySelfSection0Model *)model{
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:model.bgImagStr] placeholderImage:[UIImage imageNamed:@"meinv.jpg"]];
    
    self.nameLable.text = model.nameStr;
    
    [self.headIV sd_setImageWithURL:[NSURL URLWithString:model.headImageStr] placeholderImage:[UIImage imageNamed:@"meinv.jpg"]];
}

@end
