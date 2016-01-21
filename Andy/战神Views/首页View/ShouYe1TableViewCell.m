//
//  ShouYe1TableViewCell.m
//  E展汇
//
//  Created by lingnet on 16/1/7.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ShouYe1TableViewCell.h"

@implementation ShouYe1TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    UIView* bgView = [MyController viewWithFrame:CGRectMake(0, 7, [MyController getScreenWidth], 58)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];
    NSArray* titArr = [[NSArray alloc] initWithObjects:@"展轴",@"展会直播",@"会议", nil];
    for (int i = 0; i < 3; i++) {
        UIImageView* leftIV = [MyController createImageViewWithFrame:CGRectMake(20 + [MyController getScreenWidth] / 3 * i, 20, 25, 25) ImageName:@""];
        leftIV.backgroundColor = [UIColor redColor];
         [bgView addSubview:leftIV];
        
        UILabel* rightLable = [MyController createLabelWithFrame:CGRectMake(60 + [MyController getScreenWidth] / 3 * i, 0, 60, 65) Font:14 Text:titArr[i]];
        rightLable.textAlignment = NSTextAlignmentLeft;
        [bgView addSubview:rightLable];
        
        UIButton* indeButton = [MyController createButtonWithFrame:CGRectMake([MyController getScreenWidth] / 3 * i, 0, [MyController getScreenWidth] / 3, 65) ImageName:nil Target:self Action:@selector(indeButton:) Title:nil];
        indeButton.tag = 100 + i;
        [bgView addSubview:indeButton];
    }
}
- (void)indeButton:(UIButton*)btn{
    NSLog(@"=====%ld",(long)btn.tag);
    if (100 == btn.tag) {
        [self.ShouYe1Delegate zhanzhou];
    }else if (101 == btn.tag){
        [self.ShouYe1Delegate zhanhuizhibo];
    }else if (102 == btn.tag){
        [self.ShouYe1Delegate huiyi];
    }
}
@end
