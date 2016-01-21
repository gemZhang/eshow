
//
//  FaxianViewController.m
//  E展汇
//
//  Created by lingnet on 16/1/6.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "FaxianViewController.h"

#import "FaxianModel.h"

#import "FaXianTableViewCell.h"

@interface FaxianViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView* _tableView;
}
@property(nonatomic,retain)NSMutableArray* datasourceArr;
@end

@implementation FaxianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                                                    NSFontAttributeName : [UIFont boldSystemFontOfSize:16]};
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"发现";
    
    [self makeData];
    
    [self createTableView];
}
#pragma mark - 创建数据
- (void)makeData{
    self.datasourceArr = [[NSMutableArray alloc] init];
    NSArray* temArr = [[NSArray alloc] initWithObjects:@"留言板",@"附近",@"新品",@"服务",@"名企专区",@"明星组委会",@"展馆推荐",@"群组", nil];
    NSArray* temArr1 = [[NSArray alloc] initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"", nil];
    
    for (int i = 0; i < temArr.count; i++) {
        FaxianModel* model = [[FaxianModel alloc] init];
        model.leftImageStr = temArr1[i];
        model.titleStr = temArr[i];
        [self.datasourceArr addObject:model];
    }
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
    return self.datasourceArr.count;
}
#pragma mark - tableVie点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"faxian";
    FaXianTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell2) {
        cell2 = [[FaXianTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    FaxianModel *model = nil;
    model = [self.datasourceArr objectAtIndex:indexPath.row];
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    cell2.backgroundColor = [MyController colorWithHexString:@"f6f6f6"];
    [cell2 configCellWithModel:model];
    
    return cell2;
}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FaxianModel *model = nil;
    if (indexPath.row < self.datasourceArr.count) {
        model = [self.datasourceArr objectAtIndex:indexPath.row];
    }
    return [FaXianTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        FaXianTableViewCell *cell = (FaXianTableViewCell *)sourceCell;
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
