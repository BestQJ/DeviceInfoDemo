//
//  AAMemory.m
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AAMemory.h"
#import <mach/mach.h>
#import <mach/mach_host.h>

@implementation AAMemory

+ (NSInteger)totalMemory {
    NSInteger nearest = 256;
    NSInteger totalMemory = (NSInteger)([[NSProcessInfo processInfo] physicalMemory] / 1024 / 1024);
    NSInteger rem = totalMemory % nearest;
    NSInteger tot = totalMemory - rem;
    if (rem >= nearest/2) {
        tot += 256;
    }
    return tot;
}

+ (CGFloat)freeMemory {
    double totalMemory = 0.00;
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    totalMemory = ((vm_page_size * vmStats.free_count) / 1024) / 1024;
    
    return totalMemory;
}

+ (CGFloat)usedMemory {
    double usedMemory = 0.00;
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    usedMemory = ((vm_page_size * (vmStats.active_count + vmStats.inactive_count + vmStats.wire_count)) / 1024) / 1024;
    
    return usedMemory;
}

+ (CGFloat)activeMemory {
    double activeMemory = 0.00;
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    activeMemory = ((vm_page_size * vmStats.active_count) / 1024) / 1024;
    
    return activeMemory;
}

+ (CGFloat)wiredMemory {
    double wiredMemory = 0.00;
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    wiredMemory = ((vm_page_size * vmStats.wire_count) / 1024) / 1024;
    
    return wiredMemory;
}

+ (CGFloat)inactiveMemory {
    double inactiveMemory = 0.00;
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    inactiveMemory = ((vm_page_size * vmStats.inactive_count) / 1024) / 1024;
    
    return inactiveMemory;
}

@end
