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


@interface QPImageUploadCell()<UICollectionViewDelegate>

@property (nonatomic ,strong) UICollectionView *imagesView;
@property (nonatomic ,strong) QPImageUploadCellDataSource *imageDataSource;
@property (nonatomic ,strong) NSArray<UIImage*> *imagesData;

@end
@implementation QPImageUploadCell

#pragma mark - XLBaseCellRequired

+(void)load{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[QPImageUploadCell class] forKey:XLFormRowDescriptorTypeUpload];
    
}

- (void)configure{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.imagesView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(delImage:) name:QPPublishDelImageNotice object:nil];
}


- (void)update{
    [super update];
}

#pragma mark - methods

+ (CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor {
    return QPPublishImageCellHeight;
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - notification

- (void)delImage:(NSNotification *)notification{
    QPImageUploadImageCell *cell = (QPImageUploadImageCell *)notification.object;
    NSIndexPath *indexPath = [self.imagesView indexPathForCell:cell];
    [self.imageDataSource.itemsArray removeObjectAtIndex:indexPath.row];
    [self.imagesView reloadData];
}

#pragma mark - collectionViewDelegete

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CDZImagePickerViewController *imagePicker = [[CDZImagePickerViewController alloc]init];
    [imagePicker openPickerInController:self.formViewController withImageBlock:^(UIImage *image) {
        if (image) {
            if ((indexPath.row == self.imageDataSource.itemsArray.count - 1)) {
                NSLog(@"点击最后一个cell，执行添加操作");
                QPImageUploadImageItem *item = [QPImageUploadImageItem new];
                item.closeBtnHidden = NO;
                item.image = image;
                [self.imageDataSource.itemsArray insertObject:item atIndex:self.imageDataSource.itemsArray.count - 1];
            }else{
                NSLog(@"第%ld个cell,点击图片",indexPath.row);
                self.imageDataSource.itemsArray[indexPath.row].image = image;
            }
            [self.imagesView reloadData];
        }
    }];
}

#pragma mark - setter&getter

- (UICollectionView *)imagesView{
    if (!_imagesView) {
        UICollectionViewFlowLayout *imagesFlowLayout = [UICollectionViewFlowLayout new];
        imagesFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //水平滚动
        imagesFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/QPPublishImageCellLimit, QPPublishImageCellHeight);
        imagesFlowLayout.minimumInteritemSpacing = 0;
        imagesFlowLayout.minimumLineSpacing = 0;
        _imagesView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, QPPublishImageCellHeight) collectionViewLayout:imagesFlowLayout];
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
        [_imageDataSource.itemsArray addObject:[QPImageUploadImageItem new]];
    }
    return _imageDataSource;
}


@end
