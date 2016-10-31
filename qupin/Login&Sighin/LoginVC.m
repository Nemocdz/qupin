//
//  LoginVC.m
//  qupin
//
//  Created by Nemocdz on 2016/10/31.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *verificationCode;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.phoneNumber addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - event response

- (void)textFieldDidChange:(UITextField *)textField{
    int limited = 0;
    
    if (textField == self.phoneNumber){
        limited = 11;
    }
    if (textField == self.verificationCode){
        limited = 6;
    }
    
    if (textField.text.length > limited) {
        textField.text = [textField.text substringToIndex:limited];
    }
}

#pragma mark - setter&getter

@end
