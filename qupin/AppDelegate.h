//
//  AppDelegate.h
//  qupin
//
//  Created by Nemocdz on 2016/10/24.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWindow *loginWindow;
@property (strong, nonatomic) UIWindow *homeWindow;

+(void)openMainWindow;
+(void)openLoginWindow;

@end

