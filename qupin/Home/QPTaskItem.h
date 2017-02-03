//
//  QPTaskListItem.h
//  qupin
//
//  Created by Nemocdz on 2016/12/30.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QPUserItem;

typedef NS_ENUM(NSInteger, QPTaskItemType) {
    QPMoneyType,
    QPPeopleType,
};

typedef NS_ENUM(NSInteger, QPTaskStatus) {
    QPTaskStatusAlive,
    QPTaskStatusCancel,
    QPTaskStatusOverTime,
    QPTaskStatusDone,
};


@interface QPTaskItem : NSObject

@property (nonatomic,assign) QPTaskItemType type;
@property (nonatomic,copy) NSString *taskTitle;
@property (nonatomic,strong) NSArray<NSURL *> *taskImage;
@property (nonatomic,copy) NSString *mallName;
@property (nonatomic,strong) NSDate *createdAt;
@property (nonatomic,copy) NSString *money;
@property (nonatomic,copy) NSString *numberOfPeople;
@property (nonatomic,assign) QPTaskStatus status;
@property (nonatomic,strong) QPUserItem *publisher;
//location
@end




