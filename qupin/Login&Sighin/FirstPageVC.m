//
//  FirstPageVC.m
//  qupin
//
//  Created by Nemocdz on 2016/10/25.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "FirstPageVC.h"

@implementation FirstPageVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}


@end
