//
//  QPUser.m
//  qupin
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPUserItem.h"
#import "YYModel.h"
@interface QPUserItem()

@property (nonatomic, readwrite) NSString *username;
@property (nonatomic, readwrite) NSString *mobilePhoneNumber;
@property (nonatomic, readwrite) NSString *school;
@property (nonatomic, readwrite) NSString *sessionToken;

@end
@implementation QPUserItem

+ (QPUserItem *)currentUser{
    return [QPUserItem sharedInstance];
}


+ (instancetype)sharedInstance{
    static QPUserItem *currentuser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *dic = [userDefaults objectForKey:@"currentUser"];
        currentuser = [QPUserItem yy_modelWithDictionary:dic];
    });
    return currentuser;
}

@end

@interface QPLoginUser()

@property (nonatomic, readwrite) NSString *password;
@property (nonatomic, readwrite) NSString *smsCode;

@end

@implementation QPLoginUser

+ (QPLoginUser *)loginUser:(NSDictionary *)userInfo{
    return [QPLoginUser yy_modelWithDictionary:userInfo];
}

@end
