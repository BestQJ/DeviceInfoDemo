//
//  AANetwork.m
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AANetwork.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/ioctl.h>
#import "Reachability.h"

@implementation AANetwork

static AANetwork *_shared;

#pragma mark - Singleton methods

+ (AANetwork *)sharedInstance {
    if(!_shared) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^ {
            _shared = [[super allocWithZone:nil] init];
        });
    }
    return _shared;
}

+ (id)allocWithZone:(NSZone *)zone{
    
    return [self sharedInstance];
}
- (id)copyWithZone:(NSZone *)zone   {
  
    return self;
}

#pragma mark - Class methods
+ (NSString *)currentIPAddress {
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    NSString *wifiAddress = nil;
    NSString *cellAddress = nil;
    
    if(!getifaddrs(&interfaces)) {
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            sa_family_t sa_type = temp_addr->ifa_addr->sa_family;
            if(sa_type == AF_INET || sa_type == AF_INET6) {
                NSString *name = [NSString stringWithUTF8String:temp_addr->ifa_name];
                NSString *addr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)]; // pdp_ip0
                if([name isEqualToString:@"en0"]) {
                    wifiAddress = addr;
                } else if([name isEqualToString:@"pdp_ip0"]) {
                    cellAddress = addr;
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
        freeifaddrs(interfaces);
    }
    NSString *addr = wifiAddress ? wifiAddress : cellAddress;
    return addr ? addr : @"0.0.0.0";
}

+ (BOOL)connectedViaWiFi {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if (status == ReachableViaWiFi) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)connectedVia3G {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if (status == ReachableViaWWAN) {
        return YES;
    } else {
        return NO;
    }
}


+ (NSString *)macAddress {
    int                 mgmtInfoBase[6];
    char                *msgBuffer = NULL;
    size_t              length;
    unsigned char       macAddress[6];
    struct if_msghdr    *interfaceMsgStruct;
    struct sockaddr_dl  *socketStruct;
    NSString            *errorFlag = NULL;
    
    mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
    mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
    mgmtInfoBase[2] = 0;
    mgmtInfoBase[3] = AF_LINK;        // Request link layer information
    mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
    
    if ((mgmtInfoBase[5] = if_nametoindex("en0")) == 0) {
        errorFlag = @"if_nametoindex failure";
    } else {
        if (sysctl(mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0) {
            errorFlag = @"sysctl mgmtInfoBase failure";
        }else {
            if ((msgBuffer = malloc(length)) == NULL){
                errorFlag = @"buffer allocation failure";
            }else if (sysctl(mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0) {
                errorFlag = @"sysctl msgBuffer failure";
            }
        }
    }
    if (errorFlag != NULL) {
        NSLog(@"Error: %@", errorFlag);
        return errorFlag;
    }
    interfaceMsgStruct = (struct if_msghdr *) msgBuffer;
    socketStruct = (struct sockaddr_dl *) (interfaceMsgStruct + 1);
    memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
    NSString *macAddressString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", macAddress[0], macAddress[1], macAddress[2], macAddress[3], macAddress[4], macAddress[5]];
    free(msgBuffer);
    return macAddressString;
}



+ (NSString *)externalIPAddress {

    if (![self connectedViaWiFi] && ![self connectedVia3G]) {
        return nil;
    }
    NSError *error = nil;
    NSString *theIpHtml = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.dyndns.org/cgi-bin/check_ip.cgi"] encoding:NSUTF8StringEncoding error:&error];
    if (!error) {
        NSUInteger  an_Integer;
        NSArray *ipItemsArray;
        NSString *externalIP;
        NSScanner *theScanner;
        NSString *text = nil;
        
        theScanner = [NSScanner scannerWithString:theIpHtml];
        while ([theScanner isAtEnd] == NO) {
            [theScanner scanUpToString:@"<" intoString:NULL];
            [theScanner scanUpToString:@">" intoString:&text];
            theIpHtml = [theIpHtml stringByReplacingOccurrencesOfString: [NSString stringWithFormat:@"%@>", text] withString:@" "] ;
            ipItemsArray = [theIpHtml componentsSeparatedByString:@" "];
            an_Integer = [ipItemsArray indexOfObject:@"Address:"];
            externalIP =[ipItemsArray objectAtIndex:++an_Integer];
        }
        if (externalIP == nil || externalIP.length <= 0) {
            return nil;
        }
        return externalIP;
    } else {
        return nil;
    }
}


+ (NSString *)cellIPAddress {
    NSString *IPAddress;
    struct ifaddrs *Interfaces;
    struct ifaddrs *Temp;
    struct sockaddr_in *s4;
    char buf[64];
    
    if (!getifaddrs(&Interfaces)) {
        Temp = Interfaces;
        while(Temp != NULL) {
             if(Temp->ifa_addr->sa_family == AF_INET) {
                if([[NSString stringWithUTF8String:Temp->ifa_name] isEqualToString:@"pdp_ip0"]) {
                    s4 = (struct sockaddr_in *)Temp->ifa_addr;
                    if (inet_ntop(Temp->ifa_addr->sa_family, (void *)&(s4->sin_addr), buf, sizeof(buf)) == NULL) {
                        IPAddress = nil;
                    } else {
                        IPAddress = [NSString stringWithUTF8String:buf];
                    }
                }
            }
            Temp = Temp->ifa_next;
        }
    }
    freeifaddrs(Interfaces);
    if (IPAddress == nil || IPAddress.length <= 0) {
        return nil;
    }
    return IPAddress;
}

+ (NSString *)WiFiNetmaskAddress {
    struct ifreq afr;
    strncpy(afr.ifr_name, [@"en0" UTF8String], IFNAMSIZ-1);
    int afd = socket(AF_INET, SOCK_DGRAM, 0);
    if (afd == -1) {
        return nil;
    }
    if (ioctl(afd, SIOCGIFNETMASK, &afr) == -1) {
        close(afd);
        return nil;
    }
    close(afd);
    char *netstring = inet_ntoa(((struct sockaddr_in *)&afr.ifr_addr)->sin_addr);
    NSString *Netmask = [NSString stringWithUTF8String:netstring];
    if (Netmask == nil || Netmask.length <= 0) {
        return nil;
    }
    return Netmask;
}

+ (NSString *)WiFiBroadcastAddress {
    NSString *IPAddress = [self currentIPAddress];
    NSString *NMAddress = [self WiFiNetmaskAddress];
    if (IPAddress == nil || IPAddress.length <= 0) {
        return nil;
    }
    if (NMAddress == nil || NMAddress.length <= 0) {
        return nil;
    }
    NSArray *IPCheck = [IPAddress componentsSeparatedByString:@"."];
    NSArray *NMCheck = [NMAddress componentsSeparatedByString:@"."];
    if (IPCheck.count != 4 || NMCheck.count != 4) {
        return nil;
    }
    NSUInteger IP = 0;
    NSUInteger NM = 0;
    NSUInteger CS = 24;
    for (NSUInteger i = 0; i < 4; i++, CS -= 8) {
        IP |= [[IPCheck objectAtIndex:i] intValue] << CS;
        NM |= [[NMCheck objectAtIndex:i] intValue] << CS;
    }
    NSUInteger BA = ~NM | IP;
    NSString *BroadcastAddress = [NSString stringWithFormat:@"%ld.%ld.%ld.%ld", (long)((BA & 0xFF000000) >> 24), (long)((BA & 0x00FF0000) >> 16), (long)((BA & 0x0000FF00) >> 8), (long)(BA & 0x000000FF)];
    if (BroadcastAddress == nil || BroadcastAddress.length <= 0) {
        return nil;
    }
    return BroadcastAddress;
}

+ (NSString *)BSSID {
    NSArray *interfaces = (__bridge NSArray *) CNCopySupportedInterfaces();
    NSString *BSSID;
    for (NSString *interface in interfaces) {
        CFDictionaryRef networkDetails = CNCopyCurrentNetworkInfo((__bridge CFStringRef) interface);
        if (networkDetails) {
            BSSID = (NSString *)CFDictionaryGetValue(networkDetails, kCNNetworkInfoKeyBSSID);
            CFRelease(networkDetails);
        }
    }
    return BSSID;
}

+ (NSString *)SSID {
    NSArray *interfaces = (__bridge NSArray *) CNCopySupportedInterfaces();
    NSString *SSID;
    for (NSString *interface in interfaces) {
        CFDictionaryRef networkDetails = CNCopyCurrentNetworkInfo((__bridge CFStringRef) interface);
        if (networkDetails) {
            SSID = (NSString *)CFDictionaryGetValue(networkDetails, kCNNetworkInfoKeySSID);
            CFRelease(networkDetails);
        }
    }
    return SSID;
}

@end
 
