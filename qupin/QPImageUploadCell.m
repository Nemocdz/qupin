//
//  QPImageUploadCell.m
//  qupin
//
//  Created by Nemocdz on 2017/1/19.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "QPImageUploadCell.h"
#import "CDZImagePickerViewController.h"
#import "QPImageUploadImageCell.h"
#import "QPImageUploadCellDataSource.h"
#import "QPImageUploadImageItem.h"
#import "Masonry.h"
#import "QPStringConstant.h"

static const float QPPublishImageCellHeight = 100.0f;
static const int QPPublishImageCellLineLimit = 2;
static const int QPPublishImagesLimit = 6;

@interface QPImageUploadCell()<UICollectionViewDelegate,QPImageUploadImageCellDelegate>

@property (nonatomic ,strong) UICollectionView *imagesView;
@property (nonatomic ,strong) QPImageUploadCellDataSource *imageDataSource;
@property (nonatomic ,strong) NSArray<UIImage*> *imagesData;

@end
@implementation QPImageUploadCell

#pragma mark - XLBaseCellRequired

+(void)load{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[QPImageUploadCell class] forKey:QP_XLFormRowDescriptorTypeUpload];
    
}

- (void)configure{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.imagesView];
    [self.imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(self.contentView).offset(0);
    }];
    [self reloadCell];
}


- (void)update{
    [super update];
}

#pragma mark - methods

- (void)reloadCell{
    [self.imagesView reloadData];
    [self.imagesView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.imagesView.collectionViewLayout.collectionViewContentSize.height);
        [self.formViewController.tableView reloadData];
    }];
}



- (void)didDelete:(UICollectionViewCell *)cell{
    NSIndexPath *indexPath = [self.imagesView indexPathForCell:cell];
    [self.imageDataSource.itemsArray removeObjectAtIndex:indexPath.row];
    [self reloadCell];
}


#pragma mark - collectionViewDelegete

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    QPImageUploadImageCell *imageCell = (QPImageUploadImageCell *)cell;
    imageCell.delegate = self;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CDZImagePickerViewController *imagePicker = [[CDZImagePickerViewController alloc]init];
    [imagePicker openPickerInController:self.formViewController withImageBlock:^(UIImage *image) {
        if (image) {
            QPImageUploadImageItem *item = [QPImageUploadImageItem new];
            if ((indexPath.row == self.imageDataSource.itemsArray.count - 1)) {
                NSLog(@"点击最后一个cell，执行添加操作");
                item.image = [image imageByResizeToSize:CGSizeMake(SCREEN_HEIGHT,SCREEN_WIDTH)];
                [self.imageDataSource.itemsArray insertObject:item atIndex:self.imageDataSource.itemsArray.count - 1];
            }else{
                NSLog(@"第%ld个cell,点击图片",indexPath.row);
                item.image = image;
                self.imageDataSource.itemsArray[indexPath.row] = item;
            }
            if (self.imageDataSource.itemsArray.count < QPPublishImagesLimit + 1) {
                [self reloadCell];
            }
            else{
                [self.imagesView reloadData];
            }
        }
    }];
}



#pragma mark - setter&getter

- (UICollectionView *)imagesView{
    if (!_imagesView) {
        UICollectionViewFlowLayout *imagesFlowLayout = [UICollectionViewFlowLayout new];
        imagesFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        imagesFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/(QPPublishImagesLimit/QPPublishImageCellLineLimit), QPPublishImageCellHeight);
        imagesFlowLayout.minimumInteritemSpacing = 0;
        imagesFlowLayout.minimumLineSpacing = 0;
    
        _imagesView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 0) collectionViewLayout:imagesFlowLayout];
        _imagesView.delegate = self;
        _imagesView.dataSource = self.imageDataSource;
        _imagesView.scrollEnabled = NO;
        _imagesView.showsHorizontalScrollIndicator = NO;
        _imagesView.showsVerticalScrollIndicator = NO;
        _imagesView.backgroundColor = [UIColor whiteColor];
        [_imagesView registerNib:[UINib nibWithNibName:@"QPImageUploadImageCell" bundle:nil] forCellWithReuseIdentifier:@"QPImageUploadImageCell"];
    }
    return _imagesView;
}

- (QPImageUploadCellDataSource *)imageDataSource{
    if (!_imageDataSource) {
        _imageDataSource = [QPImageUploadCellDataSource new];
        QPImageUploadImageItem *item = [QPImageUploadImageItem new];
        item.closeBtnHidden = YES;
        [_imageDataSource.itemsArray addObject:item];
    }
    return _imageDataSource;
}


@end
