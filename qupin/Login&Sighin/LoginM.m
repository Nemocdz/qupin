//
//  LoginM.m
//  qupin
//
//  Created by Nemocdz on 2016/11/7.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "LoginM.h"

int numberOfLimted;

@implementation LoginM

+ (void)textField:(UITextField *)textfield LimitInNumber:(int)number{
    numberOfLimted = number;
    [textfield addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldDidChange:(UITextField *)textField{
    if (textField.text.length > numberOfLimted) {
        textField.text = [textField.text substringToIndex:numberOfLimted];
    }
}


@end
