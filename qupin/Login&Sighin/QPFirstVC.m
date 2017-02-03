//
//  QPFirstVC.m
//  qupin
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPFirstVC.h"
#import "AppDelegate.h"

@interface QPFirstVC ()
- (IBAction)openHome:(UIButton *)sender;

@end

@implementation QPFirstVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)openHome:(UIButton *)sender {
    [AppDelegate openMainWindow];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
