//
//  AADisk.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AADisk : NSObject

//总磁盘空间
+ (NSString *)totalDiskSpace;
//剩余磁盘空间
+ (NSString *)freeDiskSpace;
//已用磁盘空间
+ (NSString *)usedDiskSpace;
//总磁盘空间(字节)
+ (CGFloat)totalDiskSpaceInBytes;
//剩余磁盘空间(字节)
+ (CGFloat)freeDiskSpaceInBytes;
//已用磁盘空间(字节)
+ (CGFloat)usedDiskSpaceInBytes;

@end

NS_ASSUME_NONNULL_END
