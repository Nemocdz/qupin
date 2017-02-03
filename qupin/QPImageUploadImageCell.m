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
    if ([self.delegate respondsToSelector:@selector(didDelete:)]) {
        [self.delegate didDelete:self];
    }
}


- (void)setItem:(QPImageUploadImageItem *)item{
    self.imageView.image = [item.image imageByResizeToSize:self.imageView.frame.size];
    self.closeBtn.hidden = item.closeBtnHidden;
}



@end
