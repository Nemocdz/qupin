//
//  QPPlusBtn.m
//  qupin
//
//  Created by Nemocdz on 2017/1/12.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPPlusBtn.h"
#import "CYLTabBarController.h"
#import "AppDelegate.h"

@implementation QPPlusBtn

+ (id)plusButton {
    QPPlusBtn *button = [[QPPlusBtn alloc] init];
    [button setImage:[UIImage imageNamed:@"plus-btn"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, 0.0, 50.f, 50.f);
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (CGFloat)constantOfPlusButtonCenterYOffsetForTabBarHeight:(CGFloat)tabBarHeight {
    return  - 20.f;
}

- (void)clickPublish{
   // [AppDelegate openLoginWindow];
    CYLTabBarController *tabBarController = [self cyl_tabBarController];
    UIViewController *seclectVC = tabBarController.selectedViewController;
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Publish" bundle:nil] instantiateInitialViewController];
    [seclectVC presentViewController:vc animated:YES completion:nil];
}

@end
