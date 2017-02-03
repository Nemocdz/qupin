//
//  QPPhoneLoginVC.m
//  qupin
//
//  Created by Nemocdz on 2017/1/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPPhoneLoginVC.h"
#import "QPStringConstant.h"

@interface QPPhoneLoginVC ()
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
}
@end
