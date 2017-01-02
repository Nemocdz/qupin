//
//  SigninVC.m
//  qupin
//
//  Created by Nemocdz on 2016/11/7.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "SigninVC.h"
#import "LoginM.h"

@interface SigninVC ()

@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *verificationCode;

@end

@implementation SigninVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [LoginM textField:self.phoneNumber LimitInNumber:11];
    [LoginM textField:self.verificationCode LimitInNumber:6];
    [self layoutPageSubviews];
}

- (void)layoutPageSubviews{
    
}



@end
