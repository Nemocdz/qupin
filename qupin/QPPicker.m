//
//  CDZPicker.m
//  qupin
//
//  Created by Nemocdz on 2016/11/7.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import "QPPicker.h"
#import "QPStringConstant.h"
static const int pickerViewHeight = 228;
static const int toolBarHeight = 32;

@interface QPPicker()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    bool isSilde;
}

@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSString *lastString;
@property (nonatomic,  copy) QPStringResultBlock block;
@end

@implementation QPPicker

#pragma mark - AboutInit

+ (void)showPickerInView:(UIView *)view
        withObjectsArray:(NSArray *)array
          withlastString:(NSString *)string
         withStringBlock:(QPStringResultBlock)stringBlock{
    QPPicker *pickerView = [[QPPicker alloc]init];
    [pickerView initWithArray:array];
    pickerView.block = stringBlock;
    [view addSubview:pickerView];
}

- (void)initWithArray:(NSArray *)array{
    self.frame = CGRectMake(0, SCREEN_HEIGHT - pickerViewHeight, SCREEN_WIDTH, pickerViewHeight);
    self.backgroundColor = QUPIN_BLACKCOLOR;
    self.dataArray = array;
    isSilde = NO;
    
    UIButton *btnOK = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -70, 0, 40, 30)];
    btnOK.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [btnOK setTitle:@"确定" forState:UIControlStateNormal];
    [btnOK setTitleColor:QUPIN_ORANGECOLOR forState:UIControlStateNormal];
    [btnOK addTarget:self action:@selector(pickerViewBtnOk:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnOK];
        
    UIButton *btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(30, 0, 40, 30)];
    btnCancel.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [btnCancel setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnCancel addTarget:self action:@selector(pickerViewBtnCancel:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnCancel];
        
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 32, SCREEN_WIDTH, pickerViewHeight - toolBarHeight)];
    [pickerView setTintColor:QUPIN_ORANGECOLOR];
    pickerView.backgroundColor = QUPIN_BLACKCOLOR;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self addSubview:pickerView];
}


- (void)dealloc {
    NSLog(@"dealloc: %@", [[self class]description]);
}

#pragma mark - event response

- (void)pickerViewBtnOk:(UIButton *)btn{
    if (isSilde == NO){
        self.block(self.dataArray[0]);
    }
    [self removeFromSuperview];
}

- (void)pickerViewBtnCancel:(UIButton *)btn{
    self.block (self.lastString);
    [self removeFromSuperview];
}


#pragma mark - PickerDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArray.count;
}



#pragma mark - PickerDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 44;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.dataArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    isSilde = YES;
    self.block(self.dataArray[row]);
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    //设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = [UIColor clearColor];
        }
    }
    
    //设置文字的属性
    UILabel *genderLabel = [UILabel new];
    genderLabel.textAlignment = NSTextAlignmentCenter;
    genderLabel.text = self.dataArray[row];
    genderLabel.font = [UIFont systemFontOfSize:23.0];
    genderLabel.textColor = QUPIN_ORANGECOLOR;
    
    return genderLabel;
}


@end
