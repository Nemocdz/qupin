//
//  QPSigninVC.m
//  qupin
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPSignInVC.h"
#import "QPStringConstant.h"
#import "QPNetworking.h"
#import "SVProgressHUD.h"
#import "QPUserItem.h"
#import "QPRegexHelper.h"
#import "AppDelegate.h"


@interface QPSignInVC ()<QPLoginDelegate>
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)clickSignin:(UIButton *)sender;

@end

@implementation QPSignInVC

- (void)viewDidLoad{
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
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"username"
                                                rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"请输入用户名" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"password"
                                                rowType:XLFormRowDescriptorTypePassword];
    [row.cellConfigAtConfigure setObject:@"请输入密码" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"school"
                                                rowType:XLFormRowDescriptorTypeSelectorPush
                                                  title:@"学校"];
    row.selectorOptions = @[@"电子科技大学"];
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"mobilePhoneNumber"
                                                rowType:QP_XLFormRowDescriptorTypePhone];

    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"smsCode"
                                                rowType:QP_XLFormRowDescriptorTypeSmsCode];

    [section addFormRow:row];
    
    self.form = form;
}

- (IBAction)clickSignin:(UIButton *)sender{
    NSDictionary *userInfo = self.formValues;
    QPLoginUser *user = [QPLoginUser loginUser:userInfo];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    if (user.school && user.smsCode) {
        if ([QPRegexHelper checkUserName:user.username]) {
            if ([QPRegexHelper checkPassword:user.password]) {
                if ([QPRegexHelper checkTelNumber:user.mobilePhoneNumber]) {
                    [QPNetworking sharedManager].loginDelegate = self;
                    [[QPNetworking sharedManager] signIn:userInfo];
                }
                else{
                    [SVProgressHUD showErrorWithStatus:@"手机号不正确"];
                }
            }
            else{
                [SVProgressHUD showErrorWithStatus:@"密码格式错误"];
            }
        }
        else{
            [SVProgressHUD showErrorWithStatus:@"用户名格式错误"];
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
    [SVProgressHUD showSuccessWithStatus:@"注册成功"];
    [AppDelegate openMainWindow];
}

- (void)loginFailed:(NSError *)error{
    [SVProgressHUD showErrorWithStatus:@"发生错误"];
    NSLog(@"%@",error);
}


@end
