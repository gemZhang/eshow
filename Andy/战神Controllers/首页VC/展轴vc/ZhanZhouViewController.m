
//
//  ZhanZhouViewController.m
//  E展汇
//
//  Created by lingnet on 16/1/7.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ZhanZhouViewController.h"

#import "ZhanZhouModel.h"

#import "ZhanZhouTableViewCell.h"

@interface ZhanZhouViewController ()<UITableViewDataSource,UITableViewDelegate,ZhanZhouTableViewCellDelegate,UIScrollViewDelegate>{
    UITableView* _tableView;
}
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property(nonatomic,retain)NSMutableArray* datasourceArr;
@end

@implementation ZhanZhouViewController

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
    
    self.title = @"展轴";
    
    self.datasourceArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 2; i++) {
        ZhanZhouModel* model = [[ZhanZhouModel alloc] init];
        model.topImageStr = @"http://e.hiphotos.baidu.com/image/h%3D300/sign=0d25eb3f8c1363270aedc433a18da056/11385343fbf2b2118fe9f2adcc8065380dd78e09.jpg";
        model.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model];
        
        ZhanZhouModel* model1 = [[ZhanZhouModel alloc] init];
        model1.topImageStr = @"http://e.hiphotos.baidu.com/image/h%3D360/sign=85c7a9d07fec54e75eec1c18893a9bfd/314e251f95cad1c8037ed8c97b3e6709c83d5112.jpg";
        model1.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model1];
        
        ZhanZhouModel* model2 = [[ZhanZhouModel alloc] init];
        model2.topImageStr = @"http://c.hiphotos.baidu.com/image/h%3D360/sign=a05d5f5ea00f4bfb93d09852334e788f/10dfa9ec8a136327408ff2f2958fa0ec09fac794.jpg";
        model2.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model2];
        
        ZhanZhouModel* model3 = [[ZhanZhouModel alloc] init];
        model3.topImageStr = @"http://a.hiphotos.baidu.com/image/h%3D360/sign=68fc35c6327adab422d01d45bbd6b36b/f31fbe096b63f624fb85bfed8344ebf81b4ca300.jpg";
        model3.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model3];
        
        ZhanZhouModel* model4 = [[ZhanZhouModel alloc] init];
        model4.topImageStr = @"http://f.hiphotos.baidu.com/image/h%3D360/sign=e8adaa6e4310b912a0c1f0f8f3fffcb5/42a98226cffc1e17af3e61e44e90f603728de966.jpg";
        model4.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model4];
        
        ZhanZhouModel* model5 = [[ZhanZhouModel alloc] init];
        model5.topImageStr = @"http://e.hiphotos.baidu.com/image/h%3D360/sign=ce34731213dfa9ece22e501152d1f754/342ac65c10385343c715962f9113b07ecb8088e1.jpg";
        model5.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model5];
    }
    
    [self makeHuaDong];
    
    [self createTableView];
}
- (void)setSelectedSegmentIndex:(NSUInteger)index animated:(BOOL)animated{
    
}
- (void)setIndexChangeBlock:(IndexChangeBlock)indexChangeBlock{
    
}
#pragma mark - 创建滑动切换视图
- (void)makeHuaDong{
    // Tying up the segmented control to a scroll view
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], 50)];
    self.segmentedControl.sectionTitles = @[@"2012", @"2013", @"2014", @"2015", @"2016", @"2013", @"2014"];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor blackColor];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentedControl.selectionIndicatorColor = [UIColor redColor];
    self.segmentedControl.selectionIndicatorHeight = 3.0;
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.tag = 3;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake([MyController getScreenWidth] * index, 0, [MyController getScreenWidth], self.view.frame.size.height - [MyController isIOS7] - 50) animated:YES];
    }];
    
    [self.view addSubview:self.segmentedControl];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (![scrollView isKindOfClass:[UITableView class]]) {
        NSLog(@"滑动了");
    }
}

#pragma mark - ZhanZhouTableViewCellDelegate关注
- (void)guanzhu:(NSInteger)index{
    NSLog(@"关注");
}

#pragma mark - 初始化tableView
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height - 50) style:UITableViewStylePlain];
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
    self.datasourceArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 2; i++) {
        ZhanZhouModel* model = [[ZhanZhouModel alloc] init];
        model.topImageStr = @"http://g.hiphotos.baidu.com/lbs/pic/item/902397dda144ad3497fd2a9fd7a20cf431ad856c.jpg";
        model.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model];
        
        ZhanZhouModel* model1 = [[ZhanZhouModel alloc] init];
        model1.topImageStr = @"http://g.hiphotos.baidu.com/news/q%3D100/sign=1ee597d2563d269728d30c5d65fbb24f/11385343fbf2b2112d1a2f56cd8065380cd78ef6.jpg";
        model1.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model1];
        
        ZhanZhouModel* model2 = [[ZhanZhouModel alloc] init];
        model2.topImageStr = @"http://f.hiphotos.baidu.com/news/q%3D100/sign=0f281a2a968fa0ec79c7600d1696594a/e850352ac65c10383ebb16dbb5119313b17e89e6.jpg";
        model2.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model2];
        
        ZhanZhouModel* model3 = [[ZhanZhouModel alloc] init];
        model3.topImageStr = @"http://images.china.cn/attachement/jpg/site1000/20160107/b8aeedd129e317f8133f60.jpg";
        model3.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model3];
        
        ZhanZhouModel* model4 = [[ZhanZhouModel alloc] init];
        model4.topImageStr = @"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png";
        model4.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model4];
        
        ZhanZhouModel* model5 = [[ZhanZhouModel alloc] init];
        model5.topImageStr = @"http://f.hiphotos.baidu.com/lbs/pic/item/30adcbef76094b363129fc07a5cc7cd98c109da5.jpg";
        model5.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model5];
    }
    
    //下拉刷新停止
    [_tableView.header endRefreshing];
    //上拉加载停止
    [_tableView reloadData];
}
#pragma mark - 上拉加载
- (void)footRefresh{
    
    for (int i = 0; i < 2; i++) {
        ZhanZhouModel* model = [[ZhanZhouModel alloc] init];
        model.topImageStr = @"http://g.hiphotos.baidu.com/lbs/pic/item/902397dda144ad3497fd2a9fd7a20cf431ad856c.jpg";
        model.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model];
        
        ZhanZhouModel* model1 = [[ZhanZhouModel alloc] init];
        model1.topImageStr = @"http://g.hiphotos.baidu.com/news/q%3D100/sign=1ee597d2563d269728d30c5d65fbb24f/11385343fbf2b2112d1a2f56cd8065380cd78ef6.jpg";
        model1.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model1];
        
        ZhanZhouModel* model2 = [[ZhanZhouModel alloc] init];
        model2.topImageStr = @"http://f.hiphotos.baidu.com/news/q%3D100/sign=0f281a2a968fa0ec79c7600d1696594a/e850352ac65c10383ebb16dbb5119313b17e89e6.jpg";
        model2.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model2];
        
        ZhanZhouModel* model3 = [[ZhanZhouModel alloc] init];
        model3.topImageStr = @"http://images.china.cn/attachement/jpg/site1000/20160107/b8aeedd129e317f8133f60.jpg";
        model3.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model3];
        
        ZhanZhouModel* model4 = [[ZhanZhouModel alloc] init];
        model4.topImageStr = @"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png";
        model4.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model4];
        
        ZhanZhouModel* model5 = [[ZhanZhouModel alloc] init];
        model5.topImageStr = @"http://f.hiphotos.baidu.com/lbs/pic/item/30adcbef76094b363129fc07a5cc7cd98c109da5.jpg";
        model5.titleStr = @"新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐  新品推荐";
        [self.datasourceArr addObject:model5];
    }
    
    //上拉加载停止
    [_tableView.footer endRefreshing];
    
    [_tableView reloadData];
}
#pragma mark - tableView行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasourceArr.count;
}
#pragma mark - tableVie点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"zhanzhou";//[NSString stringWithFormat:@"%ld",indexPath.row];
    ZhanZhouTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell2) {
        cell2 = [[ZhanZhouTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell2.zhanzhouDelegate = self;
    cell2.cellIndex = indexPath.row;
    ZhanZhouModel *model = nil;
    model = [self.datasourceArr objectAtIndex:indexPath.row];
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    cell2.backgroundColor = [UIColor clearColor];
    [cell2 configCellWithModel:model];
    
    return cell2;
}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZhanZhouModel *model = nil;
    if (indexPath.row < self.datasourceArr.count) {
        model = [self.datasourceArr objectAtIndex:indexPath.row];
    }
    return [ZhanZhouTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        ZhanZhouTableViewCell *cell = (ZhanZhouTableViewCell *)sourceCell;
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
