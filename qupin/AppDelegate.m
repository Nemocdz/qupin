//
//  AppDelegate.m
//  qupin
//
//  Created by Nemocdz on 2016/10/24.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "AppDelegate.h"
#import "QPStringConstant.h"
#import "QPTabBarController.h"
#import "QPPlusBtn.h"


@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
  //  [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"test" bundle:nil] instantiateInitialViewController];
   // self.window = self.loginWindow;
    [self.window makeKeyAndVisible];
    [QPPlusBtn registerPlusButton];
    [self setNavigationBar];
    [self setTabbar];
    return YES;

}



- (void)setNavigationBar{
    //定义全局NavigationBar样式
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"Nav Bar"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:QP_ORANGECOLOR];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0,-80) forBarMetrics:UIBarMetricsDefault];
}

- (void)setTabbar{
    //定义全局TabBar样式
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBarTintColor:QP_BLACKCOLOR];
    [[UITabBar appearance] setTranslucent:NO];

}

+ (void)openMainWindow{
    AppDelegate *myDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    myDelegate.window = myDelegate.homeWindow;
    [myDelegate.window makeKeyAndVisible];
}

+ (void)openLoginWindow{
    AppDelegate *myDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    myDelegate.window = myDelegate.loginWindow;
    [myDelegate.window makeKeyAndVisible];
}

- (UIWindow *)homeWindow{
    if (!_homeWindow) {
        _homeWindow = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        QPTabbarController *tabvc = [[QPTabbarController alloc]init];
        [_homeWindow setRootViewController:tabvc];
    }
    return _homeWindow;
}

- (UIWindow *)loginWindow{
    if (!_loginWindow) {
        _loginWindow = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        [_loginWindow setRootViewController:[[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateInitialViewController]];
    }
    return _loginWindow;
}

@end
