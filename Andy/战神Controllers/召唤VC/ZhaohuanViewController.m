
//
//  ZhaohuanViewController.m
//  E展汇
//
//  Created by lingnet on 16/1/6.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ZhaohuanViewController.h"

#import "ZhaoHuanModel.h"

#import "ZhaoHuanTableViewCell.h"

#import "ZhaohuanDetailViewController.h"

@interface ZhaohuanViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView* _tableView;
    UIButton* daixiangyingBtn;
    UIButton* lishiBtn;
}
@property(nonatomic,retain)NSMutableArray* datasourceArr;
@property(nonatomic,assign)NSInteger dangqianSele;

@end

@implementation ZhaohuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                                                    NSFontAttributeName : [UIFont boldSystemFontOfSize:16]};
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"召唤";
    
    self.dangqianSele = 1;
    
    self.datasourceArr = [[NSMutableArray alloc] init];
    
    [self makeData];
    
    [self createTableView];
}
#pragma mark - 创建数据
- (void)makeData{
    for (int i = 0; i < 12; i++) {
        ZhaoHuanModel* model = [[ZhaoHuanModel alloc] init];
        model.headImageStr = @"";
        model.titleStr = @"仓井玛利亚";
        model.timeStr = @"9:00";
        model.distanceStr = @"10.0km";
        model.neirongStr = @"召唤内容：皮卡丘~";
        model.imageArr = [[NSMutableArray alloc] init];
        [model.imageArr addObject:@"https://ss1.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/image/h%3D360/sign=85c7a9d07fec54e75eec1c18893a9bfd/314e251f95cad1c8037ed8c97b3e6709c83d5112.jpg"];
        [model.imageArr addObject:@"http://b.hiphotos.baidu.com/image/h%3D360/sign=8cf3bac1942397ddc9799e026983b216/0823dd54564e925838c205c89982d158ccbf4e26.jpg"];
        model.statusStr = @"已响应";
        model.yearStr = @"14";
        model.monthStr = @"12月";
        [self.datasourceArr addObject:model];
    }
    
}

#pragma mark - 初始化tableView
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49 - [MyController isIOS7]) style:UITableViewStylePlain];
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
    return self.datasourceArr.count;
}
#pragma mark - tableVie点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZhaoHuanModel* model = self.datasourceArr[indexPath.row];
    ZhaohuanDetailViewController* vc = [[ZhaohuanDetailViewController alloc] init];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"zhaohuan";
    ZhaoHuanTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell2) {
        cell2 = [[ZhaoHuanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    ZhaoHuanModel *model = nil;
    model = [self.datasourceArr objectAtIndex:indexPath.row];
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    cell2.backgroundColor = [UIColor whiteColor];
    [cell2 configCellWithModel:model];
    
    return cell2;
}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZhaoHuanModel *model = nil;
    if (indexPath.row < self.datasourceArr.count) {
        model = [self.datasourceArr objectAtIndex:indexPath.row];
    }
    return [ZhaoHuanTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        ZhaoHuanTableViewCell *cell = (ZhaoHuanTableViewCell *)sourceCell;
        // 配置数据
        [cell configCellWithModel:model];
    }];
    
}
#pragma mark - tableView组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark - 创建头标题
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* topView = [MyController viewWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 96/2)];
    topView.backgroundColor = [MyController colorWithHexString:@"f6f6f6"];
    
    daixiangyingBtn = [MyController createButtonWithFrame:CGRectMake(10, 7, ([MyController getScreenWidth] - 20) / 2, 32) ImageName:@"评价-1" Target:self Action:@selector(daixiangyingBtn) Title:@"待响应"];
    [daixiangyingBtn setBackgroundColor:[UIColor blackColor]];
    [daixiangyingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    daixiangyingBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [topView addSubview:daixiangyingBtn];
    
    lishiBtn = [MyController createButtonWithFrame:CGRectMake(CGRectGetMaxX(daixiangyingBtn.frame), 7, ([MyController getScreenWidth] - 20) / 2, 32) ImageName:@"评价-2" Target:self Action:@selector(lishiBtn) Title:@"历史"];
    [lishiBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lishiBtn setBackgroundColor:[UIColor whiteColor]];
    lishiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [topView addSubview:lishiBtn];
    return topView;
}

#pragma mark - 头标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 96/2;
}

#pragma mark- 待响应
- (void)daixiangyingBtn{
    if (2 == self.dangqianSele) {
        [daixiangyingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [daixiangyingBtn setBackgroundColor:[UIColor blackColor]];
        daixiangyingBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [lishiBtn setBackgroundColor:[UIColor whiteColor]];
        [lishiBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        lishiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    self.dangqianSele = 1;
}
#pragma mark- 历史
- (void)lishiBtn{
    if (1 == self.dangqianSele) {
        [lishiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [lishiBtn setBackgroundColor:[UIColor blackColor]];
        lishiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [daixiangyingBtn setBackgroundColor:[UIColor whiteColor]];
        [daixiangyingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        daixiangyingBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    self.dangqianSele = 2;
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
