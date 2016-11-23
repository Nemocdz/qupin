//
//  CDZPicker.h
//  qupin
//
//  Created by Nemocdz on 2016/11/7.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^QPStringResultBlock)(NSString *string);

@interface QPPicker : UIView

+ (void)showPickerInView:(UIView *)view
        withObjectsArray:(NSArray *)array
          withlastString:(NSString *)string
         withStringBlock:(QPStringResultBlock)stringBlock;

@end
