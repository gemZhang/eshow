//
//  HotViewController.m
//  E展汇
//
//  Created by lingnet on 16/1/7.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "HotViewController.h"

#import "HotModel.h"

#import "HotTableViewCell.h"

#import "ZhanHuiViewController.h"

@interface HotViewController ()<UITableViewDataSource,UITableViewDelegate,HotTableViewCellDelegate>{
    UITableView* _tableView;
}
@property(nonatomic,retain)NSMutableArray* datasourceArr;
@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                                                    NSFontAttributeName : [UIFont boldSystemFontOfSize:16]};
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"热门展会";
    
    self.datasourceArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i++) {
        HotModel* model2 = [[HotModel alloc] init];
        model2.topImageStr = @"http://a.hiphotos.baidu.com/image/h%3D360/sign=857bc6350cf41bd5c553eef261db81a0/f9198618367adab4b2883a5d89d4b31c8701e450.jpg";
        model2.desStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        model2.timeStr = @"12.12";
        model2.guanzhuStr = @"111";
        [self.datasourceArr addObject:model2];
    }
    
    [self createTableView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
    [super viewWillDisappear:animated];
}
#pragma mark - HotTableViewCellDelegate关注
- (void)guanzhu:(NSInteger)index{
    NSLog(@"关注");
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
    
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self headRefresh];
    }];
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{//精度
        // 进入刷新状态后会自动调用这个block
        [self footRefresh];
    }];
}
#pragma mark - 下拉刷新
- (void)headRefresh{
    
}
#pragma mark - 上拉加载
- (void)footRefresh{
    
}
#pragma mark - tableView行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasourceArr.count;
}
#pragma mark - tableVie点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZhanHuiViewController* vc = [[ZhanHuiViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"centerCellIdentifier";
    HotTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell2) {
        cell2 = [[HotTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell2.hotDelegate = self;
    cell2.cellIndex = indexPath.row;
    HotModel *model = nil;
    model = [self.datasourceArr objectAtIndex:indexPath.row];
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    cell2.backgroundColor = [UIColor clearColor];
    [cell2 configCellWithModel:model];
    
    return cell2;
}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HotModel *model = nil;
    if (indexPath.row < self.datasourceArr.count) {
        model = [self.datasourceArr objectAtIndex:indexPath.row];
    }
    return [HotTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        HotTableViewCell *cell = (HotTableViewCell *)sourceCell;
        // 配置数据
        [cell configCellWithModel:model];
    }];

}
#pragma mark - tableView组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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
