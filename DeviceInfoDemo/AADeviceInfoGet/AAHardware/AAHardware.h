//
//  AAHardware.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAHardware : NSObject

//设备类型
+ (NSString *)deviceModel;
//设备名称
+ (NSString *)deviceName;
//设备系统名称
+ (NSString *)systemName;
//设备系统版本
+ (NSString *)systemVersion;
// 设备屏幕宽度
+ (NSInteger)screenWidth;
//设备屏幕高度
+ (NSInteger)screenHeight;
//屏幕清晰倍数 @2x @3x
+ (CGFloat)screenScale;
//屏幕分辨率
+ (NSString *)screenResolution;
//设备屏幕亮度
+ (CGFloat)brightness;
//设备型号
+ (NSString *)platformType;
//设备上次重启的时间
+ (NSString *)bootTime;
//是否开启接近感应器
+ (BOOL)proximitySensor;
//是否支持多任务
+ (BOOL)multitaskingEnabled;

@end

NS_ASSUME_NONNULL_END
