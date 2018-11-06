//
//  AASystemInfo.m
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AASystemInfo.h"

#define JudgeEmpty(parameter) (parameter != nil ? ToString(parameter) : @"")
#define ToString(parameter) (parameter !=nil ? [NSString stringWithFormat:@"%@",parameter] : @"")

@implementation AASystemInfo

//系统信息
+ (NSDictionary *)systemInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: [self jailbreakInfo] forKey: @"越狱信息"];
    [dictionary setObject: [self networkInfo] forKey: @"网络信息"];
    [dictionary setObject: [self hardwareInfo] forKey: @"设备信息"];
    [dictionary setObject: [self batteruInfo] forKey: @"电池信息"];
    [dictionary setObject: [self LocalizationInfo] forKey: @"本地化信息"];
    [dictionary setObject: [self processorInfo] forKey: @"cpu信息"];
    [dictionary setObject: [self accessoryInfo] forKey: @"设备附加插件信息"];
    [dictionary setObject: [self carrierInfo] forKey: @"设备运营商信息"];
    [dictionary setObject: [self diskInfo] forKey: @"设备磁盘信息"];
    [dictionary setObject: [self memoryInfo] forKey: @"设备内存信息"];
    return [dictionary copy];
}

//越狱信息
+ (NSDictionary *)jailbreakInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: [AAJailbreak isJailbroken] ? @"true" : @"false" forKey: AAJailbreak_isJailbroken];
    return [dictionary copy];
}

//网络信息
+ (NSDictionary *)networkInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: JudgeEmpty([AANetwork currentIPAddress]) forKey: AANetwork_currentIPAddress];
    [dictionary setObject: [AANetwork connectedViaWiFi] ? @"true" : @"false" forKey: AANetwork_connectedViaWiFi];
    [dictionary setObject: [AANetwork connectedVia3G] ? @"true" : @"false" forKey: AANetwork_connectedVia3G];
    [dictionary setObject: JudgeEmpty([AANetwork macAddress]) forKey: AANetwork_macAddress];
    [dictionary setObject: JudgeEmpty([AANetwork externalIPAddress]) forKey: AANetwork_externalIPAddress];
    [dictionary setObject: JudgeEmpty([AANetwork cellIPAddress]) forKey: AANetwork_cellIPAddress];
    [dictionary setObject: JudgeEmpty([AANetwork WiFiNetmaskAddress]) forKey: AANetwork_WiFiNetmaskAddress];
    [dictionary setObject: JudgeEmpty([AANetwork WiFiBroadcastAddress]) forKey: AANetwork_WiFiBroadcastAddress];
    [dictionary setObject: JudgeEmpty([AANetwork BSSID]) forKey: AANetwork_BSSID];
    [dictionary setObject: JudgeEmpty([AANetwork SSID]) forKey: AANetwork_SSID];
    return [dictionary copy];
}


//设备信息
+ (NSDictionary *)hardwareInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: JudgeEmpty([AAHardware deviceModel]) forKey: AAHardware_deviceModel];
    [dictionary setObject: JudgeEmpty([AAHardware deviceName]) forKey: AAHardware_deviceName];
    [dictionary setObject: JudgeEmpty([AAHardware systemName]) forKey: AAHardware_systemName];
    [dictionary setObject: JudgeEmpty([AAHardware systemVersion]) forKey: AAHardware_systemVersion];
    [dictionary setObject: [NSString stringWithFormat: @"%ld", [AAHardware screenWidth]] forKey: AAHardware_screenWidth];
    [dictionary setObject: [NSString stringWithFormat: @"%ld", [AAHardware screenHeight]] forKey: AAHardware_screenHeight];
    [dictionary setObject: [NSString stringWithFormat: @"%d", (int)[AAHardware screenScale]] forKey: AAHardware_screenScale];
    [dictionary setObject: JudgeEmpty([AAHardware screenResolution]) forKey: AAHardware_screenHeight];
    [dictionary setObject: [NSString stringWithFormat: @"%.1f%%", [AAHardware brightness]] forKey: AAHardware_brightness];
    [dictionary setObject: JudgeEmpty([AAHardware platformType]) forKey: AAHardware_platformType];
    [dictionary setObject: JudgeEmpty([AAHardware bootTime]) forKey: AAHardware_bootTime];
    [dictionary setObject: [AAHardware proximitySensor] ? @"true" : @"false" forKey: AAHardware_proximitySensor];
    [dictionary setObject: [AAHardware multitaskingEnabled] ? @"true" : @"false" forKey: AAHardware_multitaskingEnabled];
    return [dictionary copy];
}


//电池信息
+ (NSDictionary *)batteruInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: [AABattery batteryFullCharged] ? @"true" : @"false" forKey: AABattery_devicePluggedIntoPower];
    [dictionary setObject: JudgeEmpty([AABattery batteryState]) forKey: AABattery_batteryState];
    [dictionary setObject: [NSString stringWithFormat: @"%.1f%%", [AABattery batteryLevel]] forKey: AABattery_batteryLevel];
    return [dictionary copy];
}

//系统本地化信息
+ (NSDictionary *)LocalizationInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: JudgeEmpty([AALocalization language]) forKey: AALocalization_language];
    [dictionary setObject: JudgeEmpty([AALocalization timeZone]) forKey: AALocalization_timeZone];
    [dictionary setObject: JudgeEmpty([AALocalization currencySymbol]) forKey: AALocalization_currencySimbol];
    [dictionary setObject: JudgeEmpty([AALocalization currencyCode]) forKey: AALocalization_currencyCode];
    [dictionary setObject: JudgeEmpty([AALocalization country]) forKey: AALocalization_country];
    [dictionary setObject: JudgeEmpty([AALocalization measurementSystem]) forKey: AALocalization_measurementSystem];
    return [dictionary copy];
}


//系统cpu信息
+ (NSDictionary *)processorInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: [NSString stringWithFormat: @"%ld", [AAProcessor processorsNumber]] forKey: AAProcessor_processorsNumber];
    [dictionary setObject: [NSString stringWithFormat: @"%ld", [AAProcessor activeProcessorsNumber]] forKey: AAProcessor_activeProcessorsNumber];
    [dictionary setObject: [NSString stringWithFormat: @"%.2f%%", [AAProcessor cpuUsageForApp]] forKey: AAProcessor_cpuUsageForApp];
    [dictionary setObject: [AAProcessor activeProcesses] ? [AAProcessor activeProcesses] : @[] forKey: AAProcessor_activeProcesses];
    [dictionary setObject: [NSString stringWithFormat: @"%ld", [AAProcessor numberOfActiveProcesses]] forKey: AAProcessor_numberOfActiveProcesses];
    return [dictionary copy];
}


//设备附加插件信息
+ (NSDictionary *)accessoryInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: [AAAccessory accessoriesPluggedIn] ? @"true" : @"false" forKey: AAAccessory_accessoriesPluggedIn];
    [dictionary setObject: [NSString stringWithFormat: @"%ld", [AAAccessory numberOfAccessoriesPluggedIn]] forKey: AAAccessory_numberOfAccessoriesPluggedIn];
    [dictionary setObject: [AAAccessory isHeadphonesAttached] ? @"true" : @"false" forKey: AAAccessory_isHeadphonesAttached];
    return [dictionary copy];
}

//设备运营商信息
+ (NSDictionary *)carrierInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: JudgeEmpty([AACarrier carrierName]) forKey: AACarrier_carrierName];
    [dictionary setObject: JudgeEmpty([AACarrier carrierMobileCountryCode]) forKey: AACarrier_carrierISOCountryCode];
    [dictionary setObject: JudgeEmpty([AACarrier carrierMobileCountryCode]) forKey: AACarrier_carrierMobileCountryCode];
    [dictionary setObject: JudgeEmpty([AACarrier carrierMobileNetworkCode]) forKey: AACarrier_carriermobileNetworkCode];
    [dictionary setObject: [AACarrier carrierAllowsVOIP] ? @"true" : @"false" forKey: AACarrier_carrierAllowsVOIP];
    return [dictionary copy];
}


//设备磁盘信息
+ (NSDictionary *)diskInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject: JudgeEmpty([AADisk totalDiskSpace]) forKey: AADisk_totalDiskSpace];
    [dictionary setObject: JudgeEmpty([AADisk freeDiskSpace]) forKey: AADisk_freeDiskSpace];
    [dictionary setObject: JudgeEmpty([AADisk usedDiskSpace]) forKey: AADisk_usedDiskSpace];
    [dictionary setObject: [NSString stringWithFormat: @"%f", [AADisk totalDiskSpaceInBytes]] forKey: AADisk_totalDiskSpaceInBytes];
    [dictionary setObject: [NSString stringWithFormat: @"%f", [AADisk freeDiskSpaceInBytes]] forKey: AADisk_freeDiskSpaceInBytes];
    [dictionary setObject: [NSString stringWithFormat: @"%f", [AADisk usedDiskSpaceInBytes]] forKey: AADisk_usedDiskSpaceInBytes];
    return [dictionary copy];
}

//设备内存信息
+ (NSDictionary *)memoryInfo {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[NSNumber numberWithInteger:[AAMemory totalMemory]] forKey:AAMemory_totalMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[AAMemory freeMemory]] forKey:AAMemory_freeMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[AAMemory usedMemory]] forKey:AAMemory_usedMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[AAMemory activeMemory]] forKey:AAMemory_activeMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[AAMemory wiredMemory]] forKey:AAMemory_wiredMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[AAMemory inactiveMemory]] forKey:AAMemory_inactivemMemory];
    return [dictionary copy];
}
 
@end
