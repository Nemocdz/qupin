//
//  CDZStringConstant.h
//  qupin
//
//  Created by Nemocdz on 2016/11/9.
//  Copyright © 2016年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define QUPIN_ORANGECOLOR [UIColor colorWithRed:1.00 green:0.71 blue:0.42 alpha:1.00]
#define QUPIN_BLACKCOLOR [UIColor colorWithRed:0.29 green:0.30 blue:0.30 alpha:1.00]

@interface QPStringConstant : NSObject

@end
