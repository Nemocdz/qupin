//
//  QPImageUploadCellDataSource.h
//  qupin
//
//  Created by Nemocdz on 2017/1/20.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UICollectionView.h>
@class QPImageUploadImageItem;

@interface QPImageUploadCellDataSource : NSObject<UICollectionViewDataSource>

@property (nonatomic,strong) NSMutableArray<QPImageUploadImageItem *> *itemsArray;

@end
