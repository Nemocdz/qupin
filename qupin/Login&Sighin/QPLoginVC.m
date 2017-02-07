//
//  QPLoginVC.m
//  qupin
//
//  Created by Nemocdz on 2017/1/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPLoginVC.h"
#import "QPNetworking.h"
#import "QPUserItem.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"

@interface QPLoginVC ()<QPLoginDelegate>
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)clickLogin:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *phoneLoginBtn;

@end

@implementation QPLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view bringSubviewToFront:self.submitBtn];
    [self.view bringSubviewToFront:self.phoneLoginBtn];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeForm];
    }
    return self;
}


-(void)initializeForm{
    XLFormDescriptor *form = [XLFormDescriptor formDescriptor];
    XLFormSectionDescriptor *section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    XLFormRowDescriptor *row;
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"username"
                                                rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"请输入用户名" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"password"
                                                rowType:XLFormRowDescriptorTypePassword];
    [row.cellConfigAtConfigure setObject:@"请输入密码" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    self.form = form;
}


- (IBAction)clickLogin:(UIButton *)sender {
    NSDictionary *userInfo = self.formValues;
    QPLoginUser *user = [QPLoginUser loginUser:userInfo];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    if (user.username && user.password) {
            [QPNetworking sharedManager].loginDelegate = self;
            [[QPNetworking sharedManager] login:userInfo];
    }
    else{
        [SVProgressHUD showErrorWithStatus:@"信息未填写完整"];
    }
}

- (void)loginSucess:(NSDictionary *)userInfo{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userInfo forKey:@"currentUser"];
    [userDefaults synchronize];
    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
    [AppDelegate openMainWindow];
}

- (void)loginFailed:(NSError *)error{
    [SVProgressHUD showErrorWithStatus:@"发生错误"];
    NSLog(@"%@",error);
}
@end
