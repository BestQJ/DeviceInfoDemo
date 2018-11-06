//
//  AASystemInfo.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AASystemConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface AASystemInfo : NSObject

//系统信息
+ (NSDictionary *)systemInfo;

//越狱信息
+ (NSDictionary *)jailbreakInfo;
//网络信息
+ (NSDictionary *)networkInfo;
//设备信息
+ (NSDictionary *)hardwareInfo;
//电池信息
+ (NSDictionary *)batteruInfo;
//系统本地化信息
+ (NSDictionary *)LocalizationInfo;
//系统cpu信息
+ (NSDictionary *)processorInfo;
//设备附加插件信息
+ (NSDictionary *)accessoryInfo;
//设备运营商信息
+ (NSDictionary *)carrierInfo;
//设备磁盘信息
+ (NSDictionary *)diskInfo;
//设备内存信息
+ (NSDictionary *)memoryInfo;

@end

NS_ASSUME_NONNULL_END
