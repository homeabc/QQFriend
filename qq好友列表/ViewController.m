//
//  ViewController.m
//  qq好友列表
//
//  Created by 洪福清 on 2016/12/13.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "ViewController.h"
#import "PersonModel.h"
#import "GroupModel.h"
#import "MyTableViewCell.h"
#import "MyHeadView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,MyHeadViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *grupArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    
}


-(NSArray *)grupArray
{
    if (_grupArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"test.plist" ofType:nil];
        NSArray *arrDict = [NSArray arrayWithContentsOfFile:path];
        
        
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrDict) {
            GroupModel *models = [GroupModel GroupWithDict:dict];
            [arrayModels addObject:models];
        }
        _grupArray = arrayModels;
    }
    return _grupArray;
  
}



-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375, 667-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionHeaderHeight = 44;
        
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.grupArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // 在这个方法中。要根据当前组的状态）是否是展开)
    
    GroupModel *models = self.grupArray[section];
    if (models.isVisible) {
         return models.friedns.count;
    }
    else
    {
        return 0;
    }

}
static NSString *cellId = @"cellId";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    GroupModel *group = self.grupArray[indexPath.section];
    
    PersonModel *friend = group.friedns[indexPath.row];
    
    cell.models = friend;
    
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //不要在这个方法中直接创建一个uivew对象返回。因为这样无法实现重用
    GroupModel *group = self.grupArray[section];

    
    MyHeadView *headView = [MyHeadView headerViewWithTableView:tableView];
    
    //创建UITableViewHeaderFooterView
//    UITableViewHeaderFooterView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellId];
//    if (headView == nil) {
//        headView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:cellId];
//    }
    
    headView.models = group;
    headView.delegate = self;
    headView.tag = section;
    

    //在刚刚创建好的header  view中获取的header view的frame都是0
    
    return headView;
    
    
}


- (void)headViewDidClickTitleButton:(MyHeadView *)headView
{
    NSIndexSet *idxSet = [NSIndexSet indexSetWithIndex:headView.tag];
    [self.tableView reloadSections:idxSet withRowAnimation:UITableViewRowAnimationFade];
}














@end
