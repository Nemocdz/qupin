//
//  QPTaskListDatasource.h
//  qupin
//
//  Created by Nemocdz on 2016/12/29.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class QPTaskCell;

@interface QPTaskListDatasource : NSObject<UITableViewDataSource>

@property (nonatomic,strong) NSArray *itemsArray;

- (void)setupItemOfCell:(QPTaskCell *)cell AtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)cellIdentifer;
- (Class)cellClass;

@end
