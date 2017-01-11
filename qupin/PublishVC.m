//
//  PublishVC.m
//  qupin
//
//  Created by Nemocdz on 2017/1/12.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "PublishVC.h"

@interface PublishVC ()

@end

@implementation PublishVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;//可以隐藏原有的导航栏返回按钮
    
    //设置的按钮会显示在导航栏左边，返回按钮的位置
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
