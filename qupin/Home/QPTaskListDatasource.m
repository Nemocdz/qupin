//
//  QPTaskListDatasource.m
//  qupin
//
//  Created by Nemocdz on 2016/12/29.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "QPTaskListDatasource.h"
#import "QPTaskItem.h"
#import "QPTaskCell.h"

@implementation QPTaskListDatasource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemsArray.count;
}


- (QPTaskCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QPTaskCell *cell  = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifer] forIndexPath:indexPath];
    [self setupItemOfCell:cell AtIndexPath:indexPath];
    return cell;
}

- (void)setupItemOfCell:(QPTaskCell *)cell AtIndexPath:(NSIndexPath *)indexPath{
    cell.item = self.itemsArray[indexPath.row];
}


- (NSString *)cellIdentifer{
    return NSStringFromClass([self cellClass]);
}
    
- (Class)cellClass{
    return [QPTaskCell class];
}

@end
