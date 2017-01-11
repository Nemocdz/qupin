//
//  QPTabbarController.m
//  qupin
//
//  Created by Nemocdz on 2017/1/11.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPTabbarController.h"


@implementation QPTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}


- (void)setup{
    NSArray *storyboardName = @[@"Home",@"Task",@"Chat",@"User"];
    NSArray *images = @[@"tab-home",@"tab-task",@"tab-chat",@"tab-user"];
    NSArray *selects = @[@"tab-home-h",@"tab-task-h",@"tab-chat-h",@"tab-user-h"];
    NSMutableArray *attributeM = [NSMutableArray new];
    NSMutableArray *viewControllerM = [NSMutableArray new];
    for (int i = 0 ; i < images.count ;i ++){
        NSDictionary *dic = @{
                              CYLTabBarItemImage:images[i],
                              CYLTabBarItemSelectedImage:selects[i],
                              };
        [attributeM addObject:dic];
        
        UIViewController *viewController = [[UIStoryboard storyboardWithName:storyboardName[i] bundle:nil] instantiateInitialViewController];
        [viewControllerM addObject:viewController];

    }
    self.tabBarItemsAttributes = attributeM;
    self.viewControllers = viewControllerM;
}

@end
