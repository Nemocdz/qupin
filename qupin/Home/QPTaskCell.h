//
//  QPTaskCell.h
//  qupin
//
//  Created by Nemocdz on 2016/12/29.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "QPBaseTableViewCell.h"
@class QPTaskItem;

@interface QPTaskCell : UITableViewCell

@property (nonatomic,strong) QPTaskItem *item;

//@property (nonatomic,strong) UILabel *taskTitleLabel;
//@property (nonatomic,strong) UIImageView *cellImageView;
//@property (nonatomic,strong) UILabel *mallNameLabel;
//@property (nonatomic,strong) UILabel *timeLabel;
//@property (nonatomic,strong) UILabel *moneyLabel;

@end
