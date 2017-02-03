//
//  QPImageUploadImageCell.h
//  qupin
//
//  Created by Nemocdz on 2017/1/20.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QPImageUploadImageItem;

@protocol QPImageUploadImageCellDelegate <NSObject>

- (void)didDelete:(UICollectionViewCell *)cell;

@end

@interface QPImageUploadImageCell : UICollectionViewCell

@property (nonatomic ,strong) QPImageUploadImageItem *item;
@property (nonatomic ,assign) id<QPImageUploadImageCellDelegate> delegate;

@end
