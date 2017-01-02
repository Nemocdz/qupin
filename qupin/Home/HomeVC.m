//
//  HomeVC.m
//  qupin
//
//  Created by Nemocdz on 2016/12/29.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "HomeVC.h"
#import "QPTaskListDatasource.h"
#import "QPStringConstant.h"
#import "QPTaskListItem.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "SDCycleScrollView.h"

@interface HomeVC ()<UITableViewDelegate>

@property (nonatomic ,strong) UITableView *taskListView;
@property (nonatomic ,strong) UICollectionView *carouselView;
@property (nonatomic ,strong) QPTaskListDatasource *taskListDatasource;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.taskListView];
}

- (NSArray *)getItems{
    QPTaskListItem *item1 = [QPTaskListItem new];
    item1.type = QPPeopleType;
    item1.taskTitile = @"Amazonjlkjklhklhkljkljkljkljkljkljkljkljkljljlkjkljlk";
    item1.mallName = @"京东商城";
    item1.numberOfPeople = @"12";
    QPTaskListItem *item2 = [QPTaskListItem new];
    item2.taskTitile = @"Sunindsalkjdskljdslkjsdlg";
    item2.mallName = @"京东商城";
    item2.type = QPMoneyType;
    item2.money = @"4000";
    NSMutableArray *mArray = [NSMutableArray new];
    for (int i = 0; i < 15; i++) {
        [mArray addObject:item1];
        [mArray addObject:item2];
        [mArray addObject:item2];
    }
    return mArray;
}

- (NSArray *)getImages{
    UIImage *image1 = [UIImage imageNamed:@"1.png"];
    UIImage *image2 = [UIImage imageNamed:@"2.png"];
    NSMutableArray *mArray = [NSMutableArray new];
    for (int i = 0; i < 1; i++) {
        [mArray addObject:image1];
        [mArray addObject:image2];
        [mArray addObject:image2];
    }
    return mArray;
}



#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:[self.taskListDatasource cellIdentifer] cacheByIndexPath:indexPath configuration:^(id cell) {
        [self.taskListDatasource setupItemOfCell:cell AtIndexPath:indexPath];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - getter&setter

- (UITableView *)taskListView{
    if (!_taskListView) {
        _taskListView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _taskListView.dataSource = self.taskListDatasource;
        _taskListView.delegate = self;
        [_taskListView registerClass:[self.taskListDatasource cellClass] forCellReuseIdentifier:[self.taskListDatasource cellIdentifer]];
        _taskListView.tableHeaderView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 9 / 16) imageNamesGroup:[self getImages]];
    }
    return _taskListView;
}


- (QPTaskListDatasource *)taskListDatasource{
    if (!_taskListDatasource) {
        _taskListDatasource = [QPTaskListDatasource new];
        _taskListDatasource.itemsArray = [self getItems];
    }
    return _taskListDatasource;
}




@end
