//
//  QPRegexHelper.h
//  qupin
//
//  Created by Nemocdz on 2017/1/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QPRegexHelper : NSObject

//正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *)telNumber;
//正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *)password;
//正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName:(NSString *)userName;
//正则匹配用户身份证号
+ (BOOL)checkUserIdCard:(NSString *)idCard;
//正则匹配URL
+ (BOOL)checkURL:(NSString *)url;

@end
