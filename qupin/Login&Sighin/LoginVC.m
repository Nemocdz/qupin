//
//  FirstPageVC.m
//  qupin
//
//  Created by Nemocdz on 2016/10/25.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "LoginVC.h"
#import "LoginM.h"
@interface LoginVC()
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *verificationCode;
- (IBAction)sendVerificationCode:(UIButton *)sender;
- (IBAction)goHomePage:(UIButton *)sender;
- (IBAction)login:(UIButton *)sender;
- (IBAction)wechatLogin:(UIButton *)sender;
- (IBAction)qqLogin:(UIButton *)sender;
@end

@implementation LoginVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [LoginM textField:self.phoneNumber LimitInNumber:11];
    [LoginM textField:self.verificationCode LimitInNumber:6];
}

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


- (IBAction)sendVerificationCode:(UIButton *)sender {
}

- (IBAction)goHomePage:(UIButton *)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"test"];
    [self showViewController:vc sender:nil];
}

- (IBAction)login:(UIButton *)sender {
}

- (IBAction)wechatLogin:(UIButton *)sender {
}

- (IBAction)qqLogin:(UIButton *)sender {
}
@end
