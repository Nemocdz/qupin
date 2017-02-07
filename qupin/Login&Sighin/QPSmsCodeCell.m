//
//  QPSmsCodeCell.m
//  qupin
//
//  Created by Nemocdz on 2017/1/26.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPSmsCodeCell.h"
#import "QPStringConstant.h"

@implementation QPSmsCodeCell

+(void)load{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[QPSmsCodeCell class] forKey:QP_XLFormRowDescriptorTypeSmsCode];
    
}

- (void)configure{
    [super configure];
    self.textField.placeholder = @"请输入短信验证码";
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
}


@end
