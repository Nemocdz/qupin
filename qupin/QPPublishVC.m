//
//  QPPublishVC.m
//  qupin
//
//  Created by Nemocdz on 2017/1/12.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPPublishVC.h"
#import "XLForm.h"
#import "QPImageUploadCell.h"

@interface QPPublishVC ()
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)submit:(UIButton *)sender;

@end

@implementation QPPublishVC
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view bringSubviewToFront:self.submitBtn];
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(returnPreviousView)];
    self.navigationItem.leftBarButtonItem = closeButton;
    
}

- (void)returnPreviousView{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    XLFormRowDescriptor *row , *typeRow;
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"name"
                                                rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"请输入标题" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"text"
                                                rowType:XLFormRowDescriptorTypeTextView];
    [row.cellConfigAtConfigure setObject:@"请输入拼单描述，包括拼单要求等" forKey:@"textView.placeholder"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"date"
                                                rowType:XLFormRowDescriptorTypeDate
                                                  title:@"截止时间"];
    [section addFormRow:row];
    
    
    typeRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"type"
                                                    rowType:XLFormRowDescriptorTypeSelectorPush
                                                      title:@"拼单类型"];
    typeRow.selectorOptions = @[@"拼金额", @"拼人数"];
    typeRow.value = @[];
    [section addFormRow:typeRow];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"money"
                                                rowType:XLFormRowDescriptorTypeInteger
                                                  title:@"拼单金额"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.hidden = [NSString stringWithFormat:@"NOT $%@.value contains '拼金额'", typeRow];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"people"
                                                rowType:XLFormRowDescriptorTypeInteger
                                                  title:@"拼单人数"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.hidden = [NSString stringWithFormat:@"NOT $%@.value contains '拼人数'", typeRow];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"image" rowType:XLFormRowDescriptorTypeUpload];
    [section addFormRow:row];
    
    self.form = form;
}



- (IBAction)submit:(UIButton *)sender {
}
@end
