//
//  QPImageUploadCell.m
//  qupin
//
//  Created by Nemocdz on 2017/1/19.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPImageUploadCell.h"
@interface QPImageUploadCell()

@property (strong, nonatomic) IBOutlet UIView *firstView;
@property (strong, nonatomic) IBOutlet UIView *secondView;
@property (strong, nonatomic) IBOutlet UIView *thirdView;

@end
@implementation QPImageUploadCell

+(void)load{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([QPImageUploadCell class]) forKey:XLFormRowDescriptorTypeUpload];
    
}

- (void)configure{
    [super configure];
    //self.contentView.backgroundColor = [UIColor yellowColor];
  
    self.selectionStyle = UITableViewCellSelectionStyleNone;
  
   // [self addImage];

}



- (void)update{
    [super update];
}

+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor {
    return 100;
}



@end
