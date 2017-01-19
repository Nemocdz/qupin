//
//  QPImageUploadImageItem.m
//  qupin
//
//  Created by Nemocdz on 2017/1/20.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPImageUploadImageItem.h"

@implementation QPImageUploadImageItem

- (instancetype)init{
    if ((self = [super init])) {
        _image = [UIImage imageNamed:@"发单-添加"];
        _closeBtnHidden = YES;
    }
    return self;
}

@end
