//
//  QPImageUploadImageCell.m
//  qupin
//
//  Created by Nemocdz on 2017/1/20.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPImageUploadImageCell.h"
#import "QPImageUploadImageItem.h"
#import "QPStringConstant.h"

@interface QPImageUploadImageCell()

@property (strong, nonatomic) IBOutlet UIButton *closeBtn;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)delCell:(UIButton *)sender;

@end

@implementation QPImageUploadImageCell


- (IBAction)delCell:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:QPPublishDelImageNotice object:self];
}



- (void)setItem:(QPImageUploadImageItem *)item{
    self.imageView.image = [self OriginImage:item.image scaleToSize:self.imageView.frame.size];
    self.closeBtn.hidden = item.closeBtnHidden;
}

- (UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

@end
