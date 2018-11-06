//
//  AABattery.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AABattery : NSObject

//电池是否充满
+ (BOOL)batteryFullCharged;
//电池状态
+ (NSString *)batteryState;
//电池电量
+ (CGFloat)batteryLevel;


@end

NS_ASSUME_NONNULL_END
