//
//  QPImageUploadCellDataSource.m
//  qupin
//
//  Created by Nemocdz on 2017/1/20.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPImageUploadCellDataSource.h"
#import "QPImageUploadImageCell.h"

@implementation QPImageUploadCellDataSource

- (instancetype)init{
    if ((self = [super init])) {
        _itemsArray = [NSMutableArray new];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemsArray.count;
}

- (QPImageUploadImageCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    QPImageUploadImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QPImageUploadImageCell" forIndexPath:indexPath];
    cell.item = self.itemsArray[indexPath.row];
    return cell;
}

@end
