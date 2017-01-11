//
//  AppDelegate.m
//  qupin
//
//  Created by Nemocdz on 2016/10/24.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "AppDelegate.h"
#import <MaxLeap/MaxLeap.h>
#import "QPStringConstant.h"
#import "QPTabBarController.h"
#import "QPPlusBtn.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [QPPlusBtn registerPlusButton];
    QPTabbarController *tabvc = [[QPTabbarController alloc]init];
    self.window.rootViewController = tabvc;
    //定义全局NavigationBar样式
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"Nav Bar"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:QP_ORANGECOLOR];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0,-80) forBarMetrics:UIBarMetricsDefault];
    //定义全局TabBar样式
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBarTintColor:QP_BLACKCOLOR];
    [[UITabBar appearance] setTranslucent:NO];

    
//    [MaxLeap setApplicationId:@"580e1a2969dbd1000750340d" clientKey:@"YlF4cTVmdXBJZlB2VjJ4SnRPajdBZw" site:MLSiteCN];
    
//    MLObject *obj = [MLObject objectWithoutDataWithClassName:@"Test" objectId:@"561c83c0226"];
//    [obj fetchIfNeededInBackgroundWithBlock:^(MLObject * _Nullable object, NSError * _Nullable error) {
//        if (error.code == kMLErrorInvalidObjectId) {
//            NSLog(@"已经能够正确连接上你的云端应用");
//        } else {
 //           NSLog(@"应用访问凭证不正确，请检查。");
 //       }
 //   }];
    
    return YES;

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
