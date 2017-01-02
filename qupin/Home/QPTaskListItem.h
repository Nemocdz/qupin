//
//  QPTaskListItem.h
//  qupin
//
//  Created by Nemocdz on 2016/12/30.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
#import "QPStringConstant.h"

@interface QPTaskListItem : NSObject

@property (nonatomic,assign) QPTaskItemType type;
@property (nonatomic,copy) NSString *taskTitile;
@property (nonatomic,strong) UIImage *taskImage;
@property (nonatomic,copy) NSString *mallName;
@property (nonatomic,strong) NSDate *createdAt;
@property (nonatomic,copy) NSString *money;
@property (nonatomic,copy) NSString *numberOfPeople;

@end
