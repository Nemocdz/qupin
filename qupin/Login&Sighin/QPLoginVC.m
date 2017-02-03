//
//  QPLoginVC.m
//  qupin
//
//  Created by Nemocdz on 2017/1/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPLoginVC.h"
#import <AFNetworking/AFNetworking.h>
#import "QPUserItem.h"

@interface QPLoginVC ()
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)clickLogin:(UIButton *)sender;

@end

@implementation QPLoginVC

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
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"4IH7mBWQiUNHLFk0EM64xzM6-gzGzoHsz" forHTTPHeaderField:@"X-LC-Id"];
    [manager.requestSerializer setValue:@"1e3Om7o0ParIK1YIIqhb7gQp" forHTTPHeaderField:@"X-LC-Key"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    
    NSDictionary *dic = self.formValues;
    
    
    
    [manager POST:@"https://api.leancloud.cn/1.1/login" parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *responseDic = responseObject;
        [userDefaults setObject:responseDic forKey:@"currentUser"];
        [userDefaults synchronize];
        NSDictionary *currentUser = [userDefaults objectForKey:@"currentUser"];
        NSLog(@"%@",currentUser);
        NSLog(@"%@",[QPUserItem currentUser].sessionToken);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

    
}
@end
