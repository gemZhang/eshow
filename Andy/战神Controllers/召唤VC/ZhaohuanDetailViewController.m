

//
//  ZhaohuanDetailViewController.m
//  E展汇
//
//  Created by lingnet on 16/1/15.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ZhaohuanDetailViewController.h"

#import "ZhaoHuanTableViewCell.h"

#import "ZhaoHuanDetailModel.h"

#import "ZhaoHuanDetailTableViewCell.h"

@interface ZhaohuanDetailViewController ()<UITableViewDataSource,UITableViewDelegate,ZhaoHuanDetailTableViewCellDeleagte>{
    UITableView* _tableView;
}
@property(nonatomic,retain)NSMutableArray* datasourceArr0;
@property(nonatomic,retain)NSMutableArray* datasourceArr1;
@end

@implementation ZhaohuanDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                                                    NSFontAttributeName : [UIFont boldSystemFontOfSize:16]};
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"召唤详情";
    
    self.datasourceArr0 = [[NSMutableArray alloc] init];
    self.datasourceArr1 = [[NSMutableArray alloc] init];
    [self.datasourceArr0 addObject:self.model];
    
    for (int i = 0; i < 7; i++) {
        ZhaoHuanDetailModel* model = [[ZhaoHuanDetailModel alloc] init];
        model.headImageStr = @"";
        model.titleStr = @"战神";
        model.distanceStr = @"100km";
        model.timeStr = @"12.12  18：30";
        [self.datasourceArr1 addObject:model];
    }
    
    [self createTableView];
}
#pragma mark - 联系代理
- (void)lianxi:(NSInteger)index{
    NSLog(@"联系");
    NSString* kefuPhone = @"110";
    UIWebView*callWebview =[[UIWebView alloc] init];
    NSString* str = [NSString stringWithFormat:@"tel:%@",kefuPhone];
    NSURL *telURL =[NSURL URLWithString:str];
    // 貌似tel:// 或者 tel: 都行
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    //记得添加到view上
    [self.view addSubview:callWebview];
}
#pragma mark - 初始化tableView
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - [MyController isIOS7]) style:UITableViewStylePlain];
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
        return self.datasourceArr0.count;
    }
    return self.datasourceArr1.count;
}
#pragma mark - tableVie点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        NSString *cellIdentifier = @"zhaohuansection0";
        ZhaoHuanTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell2) {
            cell2 = [[ZhaoHuanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        ZhaoHuanModel *model = nil;
        model = [self.datasourceArr0 objectAtIndex:indexPath.row];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        cell2.backgroundColor = [UIColor whiteColor];
        [cell2 configCellWithModel:model];
        
        return cell2;
    }
    
    NSString *cellIdentifier = @"zhaohuansection1";
    ZhaoHuanDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[ZhaoHuanDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.lianxiDelegate = self;
    cell.cellIndex = indexPath.row;
    ZhaoHuanDetailModel *model = nil;
    model = [self.datasourceArr1 objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configCellWithModel:model];
    
    return cell;
}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 ==indexPath.section) {
        ZhaoHuanModel *model = nil;
        if (indexPath.row < self.datasourceArr0.count) {
            model = [self.datasourceArr0 objectAtIndex:indexPath.row];
        }
        return [ZhaoHuanTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            ZhaoHuanTableViewCell *cell = (ZhaoHuanTableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }
    
    ZhaoHuanDetailModel *model = nil;
    if (indexPath.row < self.datasourceArr1.count) {
        model = [self.datasourceArr1 objectAtIndex:indexPath.row];
    }
    return [ZhaoHuanDetailTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        ZhaoHuanDetailTableViewCell *cell = (ZhaoHuanDetailTableViewCell *)sourceCell;
        // 配置数据
        [cell configCellWithModel:model];
    }];
}
#pragma mark - tableView组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
#pragma mark - 创建头标题
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (1 == section) {
        UIView* topView = [MyController viewWithFrame:CGRectMake(16, 0, [MyController getScreenWidth], 70/2)];
        topView.backgroundColor = [MyController colorWithHexString:@"f6f6f6"];
        
        UILabel* titleLable = [MyController createLabelWithFrame:CGRectMake(10, 0, 200, 35) Font:14 Text:@"响应的商家"];
        [topView addSubview:titleLable];
        
        return topView;
    }
    return nil;
}

#pragma mark - 头标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (1 == section) {
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
