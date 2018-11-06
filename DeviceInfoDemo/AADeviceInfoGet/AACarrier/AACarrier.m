//
//  AACarrier.m
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AACarrier.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation AACarrier

+ (NSString *)carrierName {
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    return [carrier carrierName];
}

+ (NSString *)carrierISOCountryCode {
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    return [carrier isoCountryCode];
}

+ (NSString *)carrierMobileCountryCode {
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    return [carrier mobileCountryCode];
}

+ (NSString *)carrierMobileNetworkCode {
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    return [carrier mobileNetworkCode];
}

+ (BOOL)carrierAllowsVOIP {
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    return [carrier allowsVOIP];
}

@end
