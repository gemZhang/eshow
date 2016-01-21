
//
//  ShouyeViewController.m
//  E展汇
//
//  Created by lingnet on 16/1/6.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "ShouyeViewController.h"

#import "ShouYe0Model.h"

#import "ShouYe0TableViewCell.h"

#import "ShouYe1TableViewCell.h"

#import "ShouYe2Model.h"

#import "ShouYe2TableViewCell.h"

#import "HotViewController.h"

#import "NewViewController.h"

#import "ZhanZhouViewController.h"

#import "ZhanHuiViewController.h"

@interface ShouyeViewController ()<UITableViewDataSource,UITableViewDelegate,ShouYe0TableViewCellDelegate,ShouYe1TableViewCellDelegate,ShouYe2TableViewCellDelegate>{
    UITableView* _tableView;
}
//section0的广告数据源
@property(nonatomic,retain)NSMutableArray* picturesArr;
@property(nonatomic,retain)NSMutableArray* datasourceArr;

@end

@implementation ShouyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.picturesArr = [[NSMutableArray alloc] init];
    
    ShouYe0Model* model = [[ShouYe0Model alloc] init];
    model.picArr = [[NSMutableArray alloc] initWithObjects:@"http://g.hiphotos.baidu.com/image/h%3D360/sign=67e798609a22720e64cee4fc4bcb0a3a/4a36acaf2edda3cc12c9852203e93901213f9286.jpg",@"http://e.hiphotos.baidu.com/image/h%3D360/sign=bd44efd5808ba61ec0eece29713597cc/0e2442a7d933c895dd327164d31373f082020064.jpg",@"http://e.hiphotos.baidu.com/image/h%3D360/sign=505d2055369b033b3388fadc25cf3620/77c6a7efce1b9d16798da730f1deb48f8c54641c.jpg",@"http://a.hiphotos.baidu.com/image/h%3D360/sign=2d30e2ac79899e51678e3c1272a6d990/e824b899a9014c0876cc19f4087b02087af4f4ef.jpg", nil];
    [self.picturesArr addObject:model];
    
    self.datasourceArr = [[NSMutableArray alloc] init];
    ShouYe2Model* model2 = [[ShouYe2Model alloc] init];
    model2.leftImageStr = @"";
    model2.leftTitleStr = @"新品推荐";
    model2.conterImageStr = @"http://e.hiphotos.baidu.com/image/h%3D360/sign=70da45d6f21f3a2945c8d3c8a924bce3/fd039245d688d43f7b1a75fa7f1ed21b0ef43b03.jpg";
    [self.datasourceArr addObject:model2];
    
    ShouYe2Model* model3 = [[ShouYe2Model alloc] init];
    model3.leftImageStr = @"";
    model3.leftTitleStr = @"热门展会";
    model3.conterImageStr = @"http://b.hiphotos.baidu.com/image/h%3D360/sign=0b04f7af68224f4a4899751539f59044/b3b7d0a20cf431ad7210c2b04e36acaf2fdd987d.jpg";
    [self.datasourceArr addObject:model3];
    
    [self createTableView];
    
    [self loadAvatarInKeyWindow];
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
#pragma mark - ShouYe0TableViewCellDelegate展会广告代理
- (void)didselectADPic:(NSInteger)index{
    NSLog(@"---点击了第%ld张---",(long)index);
}
#pragma mark - ShouYe1TableViewCellDelegate展轴
- (void)zhanzhou{
    ZhanZhouViewController* vc = [[ZhanZhouViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - ShouYe1TableViewCellDelegate展会直播
- (void)zhanhuizhibo{
    
}
#pragma mark - ShouYe1TableViewCellDelegate会议
- (void)huiyi{
    
}
#pragma mark - ShouYe2TableViewCellDelegate更多
- (void)more:(NSInteger)index{
    if (1 == index) {
        NSLog(@"热门展会");
        HotViewController* vc = [[HotViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (0 == index){
        NewViewController* vc = [[NewViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
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
    if (section == 2) {
        return self.datasourceArr.count;
    }
    return 1;
}
#pragma mark - tableVie点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        NSLog(@"点击了第三组");
        ZhanHuiViewController* vc = [[ZhanHuiViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        static NSString *cellIdentifier = @"CellIdentifier";
        ShouYe0TableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell0) {
            cell0 = [[ShouYe0TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell0.ShouYe0Delegate = self;
        ShouYe0Model *model = nil;
        model = [self.picturesArr objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        
        return cell0;
    }else if (indexPath.section == 1){
        static NSString *cellIdentifier = @"CellIdentifier1";
        ShouYe1TableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell1) {
            cell1 = [[ShouYe1TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell1.ShouYe1Delegate = self;
        cell1.backgroundColor = [UIColor clearColor];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
    }else if (indexPath.section == 2){
        static NSString *cellIdentifier = @"centerCellIdentifier";
        ShouYe2TableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell2) {
            cell2 = [[ShouYe2TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell2.ShouYe2Delegate = self;
        cell2.cellIndex = indexPath.row;
        ShouYe2Model *model = nil;
        model = [self.datasourceArr objectAtIndex:indexPath.row];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        cell2.backgroundColor = [UIColor clearColor];
        [cell2 configCellWithModel:model];
        
        return cell2;
    }
    return cell;
}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ShouYe0Model *model = nil;
        if (indexPath.row < self.picturesArr.count) {
            model = [self.picturesArr objectAtIndex:indexPath.row];
        }
        return [ShouYe0TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            ShouYe0TableViewCell *cell = (ShouYe0TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }else if (indexPath.section == 1){
        return 65;
    }else if (indexPath.section == 2){
        ShouYe2Model *model = nil;
        if (indexPath.row < self.datasourceArr.count) {
            model = [self.datasourceArr objectAtIndex:indexPath.row];
        }
        return [ShouYe2TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            ShouYe2TableViewCell *cell = (ShouYe2TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }
    return 0;
}
#pragma mark - tableView组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (void)loadAvatarInKeyWindow {
    RCDraggableButton *avatar = [[RCDraggableButton alloc] initInKeyWindowWithFrame:CGRectMake([MyController getScreenWidth] - 60, [MyController getScreenHeight] - 140, 60, 60)];
//    avatar.backgroundColor = [UIColor blackColor];
    [avatar setBackgroundImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
    
    [avatar setLongPressBlock:^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in keyWindow ===  LongPress!!! ===");
        //More todo here.
        
    }];
    
    [avatar setTapBlock:^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in keyWindow ===  Tap!!! ===");
        //More todo here.
        UIViewController* vc = [[UIViewController alloc] init];
        vc.title = @"测试用";
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    [avatar setDoubleTapBlock:^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in keyWindow ===  DoubleTap!!! ===");
        //More todo here.
        
    }];
    
    [avatar setDraggingBlock:^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in keyWindow === Dragging!!! ===");
        //More todo here.
        
    }];
    
    [avatar setDragDoneBlock:^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in keyWindow === DragDone!!! ===");
        //More todo here.
        
    }];
    
    [avatar setAutoDockingBlock:^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in keyWindow === AutoDocking!!! ===");
        //More todo here.
        
    }];
    
    [avatar setAutoDockingDoneBlock:^(RCDraggableButton *avatar) {
        NSLog(@"\n\tAvatar in keyWindow === AutoDockingDone!!! ===");
        //More todo here.
        
    }];
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
