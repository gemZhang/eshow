
//
//  ZhanHuiViewController.m
//  E展汇
//
//  Created by lingnet on 16/1/20.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ZhanHuiViewController.h"

#import "ZhanHuiSection1TableViewCell.h"
@interface ZhanHuiViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView* _tableView;
}
@property(nonatomic,retain)NSMutableArray* datasourceArr0;
@property(nonatomic,retain)NSMutableArray* datasourceArr1;
@property(nonatomic,retain)NSMutableArray* datasourceArr2;
@property(nonatomic,retain)NSMutableArray* datasourceArr3;
@end

@implementation ZhanHuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.datasourceArr0 = [[NSMutableArray alloc] init];
    self.datasourceArr1 = [[NSMutableArray alloc] init];
    self.datasourceArr2 = [[NSMutableArray alloc] init];
    self.datasourceArr3 = [[NSMutableArray alloc] init];
    [self createTableView];
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
#pragma mark - 初始化tableView
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:nil];
    tableBg.backgroundColor = [MyController colorWithHexString:@"f6f6f6"];
    [_tableView setBackgroundView:tableBg];
    //分割线类型
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    //_tableView.backgroundColor = [UIColor colorWithRed:190 green:30 blue:96 alpha:1];
    [self.view addSubview:_tableView];
}
#pragma mark - tableView行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (0 == section) {
        return 0;
    }else if (1 == section){
        return 1;
    }else if (2 == section){
        return 0;
    }
    return self.datasourceArr3.count;
}
#pragma mark - tableVie点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        NSString *cellIdentifier = @"zhanhui";
        ZhanHuiSection1TableViewCell *celll = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!celll) {
            celll = [[ZhanHuiSection1TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        celll.selectionStyle = UITableViewCellSelectionStyleNone;
        return celll;
    }
    
    return nil;
}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (1 == indexPath.section) {
        return 300;
    }
    return 0;
}
#pragma mark - tableView组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
#pragma mark - 创建头标题
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (0 == section) {
        UIView* bgView = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 35)];
        bgView.backgroundColor = [MyController colorWithHexString:@"f6f6f6"];
        
        UIView* whiteBg = [MyController viewWithFrame:CGRectMake(0, 5, [MyController getScreenWidth], 30)];
        whiteBg.backgroundColor = [UIColor whiteColor];
        [bgView addSubview:whiteBg];
        
        UIImageView* leftHeadImageView = [MyController createImageViewWithFrame:CGRectMake(10, 10, 20, 20) ImageName:@""];
        leftHeadImageView.backgroundColor = [UIColor redColor];
        [whiteBg addSubview:leftHeadImageView];
        
        UILabel* titL = [MyController createLabelWithFrame:CGRectMake(CGRectGetMaxX(leftHeadImageView.frame) + 5, 16, 100, 14) Font:14 Text:@"留言板"];
        [whiteBg addSubview:titL];
        
        return bgView;
    }
    return nil;
}
#pragma mark - 头标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (2 == section) {
        return 35;
    }
    return 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
