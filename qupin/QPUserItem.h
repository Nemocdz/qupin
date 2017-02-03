//
//  QPUser.h
//  qupin
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QPUserItem : NSObject

@property (nonatomic, readonly) NSString *userName;
@property (nonatomic, readonly) NSString *mobilePhoneNumber;
@property (nonatomic, readonly) NSString *school;
@property (nonatomic, readonly) NSString *sessionToken;

+ (QPUserItem *)currentUser;

@end
