//
//  QPPhoneLoginVC.m
//  qupin
//
//  Created by Nemocdz on 2017/1/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPPhoneLoginVC.h"
#import "QPStringConstant.h"
#import "QPNetworking.h"
#import "SVProgressHUD.h"
#import "QPUserItem.h"
#import "QPRegexHelper.h"
#import "AppDelegate.h"

@interface QPPhoneLoginVC ()<QPLoginDelegate>
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)clickLogin:(UIButton *)sender;

@end

@implementation QPPhoneLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view bringSubviewToFront:self.submitBtn];
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
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"mobilePhoneNumber"
                                                rowType:QP_XLFormRowDescriptorTypePhone];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"smsCode"
                                                rowType:QP_XLFormRowDescriptorTypeSmsCode];
    [section addFormRow:row];
    self.form = form;
}


- (IBAction)clickLogin:(UIButton *)sender {
    NSDictionary *userInfo = self.formValues;
    QPLoginUser *user = [QPLoginUser loginUser:userInfo];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    if (user.smsCode && user.mobilePhoneNumber){
        if ([QPRegexHelper checkTelNumber:user.mobilePhoneNumber]) {
            [QPNetworking sharedManager].loginDelegate = self;
            [[QPNetworking sharedManager] phoneLogin:userInfo];
        }
        else{
            [SVProgressHUD showErrorWithStatus:@"手机号错误"];
        }
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
