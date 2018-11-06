
//
//  AAAccessory.m
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AAAccessory.h"
#import <ExternalAccessory/ExternalAccessory.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation AAAccessory

+ (BOOL)accessoriesPluggedIn {
    NSInteger accessoryCount = [[[EAAccessoryManager sharedAccessoryManager] connectedAccessories] count];
    if (accessoryCount > 0) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSInteger)numberOfAccessoriesPluggedIn {
    
    return [[[EAAccessoryManager sharedAccessoryManager] connectedAccessories] count];
}

+ (BOOL)isHeadphonesAttached {
    return NO;
}
@end
