//
//  AANetwork.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AANetwork : NSObject

//设备当前ip地址
+ (NSString *)currentIPAddress;
//设备是否连接WiFi
+ (BOOL)connectedViaWiFi;
//是被是否连接移动网络
+ (BOOL)connectedVia3G;
//设备Mac地址
+ (NSString *)macAddress;
//外部IP地址
+ (NSString *)externalIPAddress;
/*!
 * The cell IP address
 @return NSString represents the cell IP address
 */
+ (NSString *)cellIPAddress;
//无线子网掩码地址
+ (NSString *)WiFiNetmaskAddress;
//WiFi广播地址
+ (NSString *)WiFiBroadcastAddress;
//网络的BSSID
+ (NSString *)BSSID;
//网络的BSSID
+ (NSString *)SSID;

@end

NS_ASSUME_NONNULL_END
