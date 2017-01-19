 //
//  QPTaskCell.m
//  qupin
//
//  Created by Nemocdz on 2016/12/29.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//


#import "QPTaskCell.h"
#import "QPTaskListItem.h"
//#import "Masonry.h"
#import "QPStringConstant.h"
@interface QPTaskCell()
@property (strong, nonatomic) IBOutlet UIImageView *cellImageView;
@property (strong, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *mallNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *moneyLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation QPTaskCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        //[self creatView];
//       // [self setLayout];
//        [self layoutIfNeeded];
//    }
//    return self;
//}

//- (void)awakeFromNib{
//    [super awakeFromNib];
//}

//- (void)creatView{
//    [self.contentView addSubview:self.cellImageView];
//    [self.contentView addSubview:self.taskTitleLabel];
//    [self.contentView addSubview:self.mallNameLabel];
//    [self.contentView addSubview:self.timeLabel];
//    [self.contentView addSubview:self.moneyLabel];
//}

//- (void)setLayout{
//    [self.cellImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
//        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
//        make.height.and.width.mas_equalTo(80);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15);
//    }];
//    
//    [self.mallNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.contentView.mas_top).offset(5);
//        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
//    }];
//    
//    [self.taskTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.mallNameLabel.mas_bottom).offset(10);
//       // make.top.equalTo(self.cellImageView.mas_top);
//        make.left.mas_equalTo(self.cellImageView.mas_right).offset(20);
//        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
//    }];
//    
//    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.cellImageView.mas_bottom);
//        make.left.equalTo(self.taskTitleLabel.mas_left);
//    }];
//    
//    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.cellImageView.mas_bottom);
//        make.right.equalTo(self.taskTitleLabel.mas_right);
//    }];
//    
//}

- (void)setItem:(QPTaskListItem *)item{
    self.taskTitleLabel.text = item.taskTitle;
    self.mallNameLabel.text = item.mallName;
    self.timeLabel.text = @"4天后截止";
    switch (item.type) {
        case QPMoneyType:
            self.moneyLabel.attributedText = [self attributedStringForString:[self stringForMoney:item.money]];;
            break;
        case QPPeopleType:
            self.moneyLabel.attributedText = [self attributedStringForString:[self stringForPeople:item.numberOfPeople]];
            break;
    }
}

- (NSString *)stringForPeople:(NSString *)people{
    return  [NSString stringWithFormat:@"还需 %@人",people];
}

- (NSString *)stringForMoney:(NSString *)money{
    return  [NSString stringWithFormat:@"还需 %@元",money];
}

- (NSMutableAttributedString *)attributedStringForString:(NSString *)string{
    NSMutableAttributedString *resultString = [[NSMutableAttributedString alloc]initWithString:string];
    [resultString addAttribute:NSForegroundColorAttributeName value:QP_TASKCELLOTHERBLACK range:NSMakeRange(0, 2)];
    [resultString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.f] range:NSMakeRange(0, 2)];
    return resultString;
}


//- (UIImageView *)cellImageView{
//    if (!_cellImageView) {
//        _cellImageView = [UIImageView new];
//        _cellImageView.contentMode = UIViewContentModeScaleAspectFit;
//        _cellImageView.backgroundColor = [UIColor greenColor];
//    }
//    return _cellImageView;
//}
//
//- (UILabel *)taskTitleLabel{
//    if (!_taskTitleLabel) {
//        _taskTitleLabel = [UILabel new];
//        _taskTitleLabel.font = [UIFont systemFontOfSize:18.f];
//        _taskTitleLabel.numberOfLines = 0;
//        _taskTitleLabel.textColor = QP_TASKCELLTITLEBLACK;
//    }
//    return _taskTitleLabel;
//}
//
//- (UILabel *)mallNameLabel{
//    if (!_mallNameLabel) {
//        _mallNameLabel = [UILabel new];
//        _mallNameLabel.font = [UIFont systemFontOfSize:10.f];
//        _mallNameLabel.textColor = QP_TASKCELLOTHERBLACK;
//    }
//    return _mallNameLabel;
//}
//
//- (UILabel *)timeLabel{
//    if (!_timeLabel) {
//        _timeLabel = [UILabel new];
//        _timeLabel.font = [UIFont systemFontOfSize:14.f];
//        _timeLabel.textColor = QP_TASKCELLOTHERBLACK;
//    }
//    return _timeLabel;
//}
//
//- (UILabel *)moneyLabel{
//    if (!_moneyLabel) {
//        _moneyLabel = [UILabel new];
//        _moneyLabel.font = [UIFont systemFontOfSize:20.f];
//        _moneyLabel.textColor = [UIColor redColor];
//    }
//    return _moneyLabel;
//}




@end
