//
//  QPSigninVC.m
//  qupin
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPSigninVC.h"
#import "QPStringConstant.h"
#import <AFNetworking/AFNetworking.h>

@interface QPSigninVC ()
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)clickSignin:(UIButton *)sender;

@end

@implementation QPSigninVC

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
   // [row.cellConfigAtConfigure setObject:@"请输入手机号" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"smsCode"
                                                rowType:QP_XLFormRowDescriptorTypeSmsCode];
    
    
    //[row.cellConfigAtConfigure setObject:@"请输入短信验证码" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    self.form = form;
}

- (IBAction)clickSignin:(UIButton *)sender{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"4IH7mBWQiUNHLFk0EM64xzM6-gzGzoHsz" forHTTPHeaderField:@"X-LC-Id"];
    [manager.requestSerializer setValue:@"1e3Om7o0ParIK1YIIqhb7gQp" forHTTPHeaderField:@"X-LC-Key"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    
    NSDictionary *dic = self.formValues;
    
  
    
    [manager POST:@"https://api.leancloud.cn/1.1/usersByMobilePhone" parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *responseDic = responseObject;
        [userDefaults setObject:responseDic forKey:@"currentUser"];
        [userDefaults synchronize];
        NSDictionary *currentUser = [userDefaults objectForKey:@"currentUser"];
        NSLog(@"%@",currentUser);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    

    
}


@end
