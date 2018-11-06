//
//  AABattery.m
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AABattery.h"
#import "AAHardware.h"
#import <sys/utsname.h>

@implementation AABattery

+ (UIDevice *)device {
  
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
   
    return [UIDevice currentDevice];
}

+ (BOOL)batteryFullCharged {
    if ([self batteryLevel] == 100.00) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSString *)batteryState {
    NSString *batteryStatu = @"";
    switch ([self device].batteryState) {
        case UIDeviceBatteryStateUnknown:
            batteryStatu = @"无法取得充电状态情况";
            break;
        case UIDeviceBatteryStateUnplugged:
            batteryStatu = @"非充电状态";
            break;
        case UIDeviceBatteryStateCharging:
            batteryStatu = @"充电状态";
            break;
        case UIDeviceBatteryStateFull:
            batteryStatu = @"充满状态（连接充电器充满状态）";
            break;
        default:
            break;
    }
    return batteryStatu;
}

+ (CGFloat)batteryLevel {
    CGFloat batteryLevel = 0.0f;
    CGFloat batteryCharge = [self device].batteryLevel;
    if (batteryCharge > 0.0f) {
        batteryLevel = batteryCharge * 100;
    } else {
        return -1;
    }
    return batteryLevel;
}

@end
