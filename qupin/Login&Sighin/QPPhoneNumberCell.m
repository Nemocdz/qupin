//
//  QPVerificationCodeCell.m
//  qupin
//
//  Created by Nemocdz on 2017/1/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPPhoneNumberCell.h"
#import "QPStringConstant.h"
#import "Masonry.h"
#import "QPRegexHelper.h"
#import <AFNetworking/AFNetworking.h>
@interface QPPhoneNumberCell()

@property (strong, nonatomic) IBOutlet UIButton *sendCodeBtn;
- (IBAction)sendCode:(UIButton *)sender;

@end
@implementation QPPhoneNumberCell

+(void)load{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([QPPhoneNumberCell class]) forKey:QP_XLFormRowDescriptorTypePhone];
    
}

- (void)configure{
    [super configure];
    self.textField.keyboardType = UIKeyboardTypePhonePad;
    self.textField.placeholder = @"请输入手机号码";
    [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.left).offset(15);
        make.right.mas_equalTo(self.contentView.right).offset(-75);
    }];
}



- (IBAction)sendCode:(UIButton *)sender {
    if ([QPRegexHelper checkTelNumber:self.textField.text]) {
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"4IH7mBWQiUNHLFk0EM64xzM6-gzGzoHsz" forHTTPHeaderField:@"X-LC-Id"];
        [manager.requestSerializer setValue:@"1e3Om7o0ParIK1YIIqhb7gQp" forHTTPHeaderField:@"X-LC-Key"];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        NSDictionary *parameters = @{@"mobilePhoneNumber" : self.textField.text,
                                     @"name" : @"趣拼",
                                     @"ttl" : @200,
                                     @"op" : @"注册"};
        [manager POST:@"https://api.leancloud.cn/1.1/requestSmsCode" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"短信已发送");
            [self countDownBtn:sender];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请检查网络");
        }];
    }
    else{
        NSLog(@"请输入正确手机号");
    }
}



- (void)countDownBtn:(UIButton *)button{
    __block NSInteger time = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(time <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                [button setTitle:@"发送验证码" forState:UIControlStateNormal];
                button.enabled = YES;
            });
            
        }else{
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮显示读秒效果
                [button setTitle:[NSString stringWithFormat:@"重新发送%.2d", seconds] forState:UIControlStateNormal];
                button.enabled = NO;
            });
            time --;
        }
    });
    dispatch_resume(_timer);
}

@end
