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





@end
