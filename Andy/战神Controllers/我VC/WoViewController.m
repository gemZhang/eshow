
//
//  WoViewController.m
//  E展汇
//
//  Created by lingnet on 16/1/6.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "WoViewController.h"

#import "MySelfModel.h"

#import "MySelfSection0Model.h"

#import "MySelfTableViewCell.h"

#import "MySelfSection0TableViewCell.h"

#import "MoreViewController.h"
@interface WoViewController ()<UITableViewDataSource,UITableViewDelegate,MySelfSection0TableViewCellDeleagte>{
    UITableView* _tableView;
}
@property(nonatomic,retain)NSMutableArray* leftImageArr;
@property(nonatomic,retain)NSMutableArray* titleArr;
@property(nonatomic,retain)NSMutableArray* datasourceArr;
@property(nonatomic,retain)NSMutableArray* datasourceArr0;
@end

@implementation WoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.datasourceArr = [[NSMutableArray alloc] init];
    self.leftImageArr = [[NSMutableArray alloc] initWithObjects:@"a",@"a",@"a",@"a",@"a",@"a",@"a",@"a", nil];
    self.titleArr = [[NSMutableArray alloc] initWithObjects:@"个人信息",@"我的账户",@"我的订单",@"我的展会",@"我的产品",@"我的资料",@"我的认证",@"我的VIP", nil];
    for (int i = 0; i < self.leftImageArr.count; i++) {
        MySelfModel* model = [[MySelfModel alloc] init];
        model.leftImageStr = self.leftImageArr[i];
        model.titleStr = self.titleArr[i];
        [self.datasourceArr addObject:model];
    }
    self.datasourceArr0 = [[NSMutableArray alloc] init];
    MySelfSection0Model* model1 = [[MySelfSection0Model alloc] init];
    model1.headImageStr = @"http://b.hiphotos.baidu.com/image/h%3D360/sign=cf33cd9edeb44aed464eb8e2831d876a/bf096b63f6246b6045187ca0eff81a4c500fa2d4.jpg";
    model1.nameStr = @"皮卡丘";
    model1.bgImagStr = @"http://a.hiphotos.baidu.com/image/h%3D360/sign=857bc6350cf41bd5c553eef261db81a0/f9198618367adab4b2883a5d89d4b31c8701e450.jpg";
    [self.datasourceArr0 addObject:model1];
    
    [self createTableView];
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
#pragma mark - 一大堆代理
- (void)gengduo{
    NSLog(@"更多");
    MoreViewController* vc = [[MoreViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)hongbao{
    NSLog(@"红包");
}
- (void)xiaoxi{
    NSLog(@"消息");
}
- (void)guanzhu{
    NSLog(@"关注");
}
#pragma mark - 初始化tableView
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49) style:UITableViewStylePlain];
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
    if (1 == section) {
        return self.datasourceArr.count;
    }
    return self.datasourceArr0.count;
}
#pragma mark - tableVie点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        NSString *cellIdentifier = @"MySelf0";
        MySelfSection0TableViewCell *celll = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!celll) {
            celll = [[MySelfSection0TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        celll.myselfDelegate = self;
        MySelfSection0Model *model = nil;
        model = [self.datasourceArr0 objectAtIndex:indexPath.row];
        celll.selectionStyle = UITableViewCellSelectionStyleNone;
        [celll configCellWithModel:model];
        
        return celll;
    }
    
    NSString *cellIdentifier = @"MySelf";
    MySelfTableViewCell *celll = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!celll) {
        celll = [[MySelfTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    MySelfModel *model = nil;
    model = [self.datasourceArr objectAtIndex:indexPath.row];
    celll.selectionStyle = UITableViewCellSelectionStyleNone;
    [celll configCellWithModel:model];
    
    return celll;
}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        MySelfSection0Model *model = nil;
        if (indexPath.row < self.datasourceArr0.count) {
            model = [self.datasourceArr0 objectAtIndex:indexPath.row];
        }
        return [MySelfSection0TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            MySelfSection0TableViewCell *cell = (MySelfSection0TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }
    MySelfModel *model = nil;
    if (indexPath.row < self.datasourceArr.count) {
        model = [self.datasourceArr objectAtIndex:indexPath.row];
    }
    return [MySelfTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        MySelfTableViewCell *cell = (MySelfTableViewCell *)sourceCell;
        // 配置数据
        [cell configCellWithModel:model];
    }];
}
#pragma mark - tableView组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
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
