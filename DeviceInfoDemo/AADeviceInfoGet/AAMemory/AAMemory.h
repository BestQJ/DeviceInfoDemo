//
//  AAMemory.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAMemory : NSObject

//检查设备的总内存
+ (NSInteger)totalMemory;
//检查剩余内存
+ (CGFloat)freeMemory;
//检查已用内存
+ (CGFloat)usedMemory;

/*!
 Check the active memory
 @return CGFloat which represents the active memory of the device
 */
+ (CGFloat)activeMemory;

/*!
 Check wired memory
 @return CGFloat which represents the wired memory
 */
+ (CGFloat)wiredMemory;

/*!
 Check the inactive memory
 @return CGFloat which represents the inactive memory
 */
+ (CGFloat)inactiveMemory;
@end

NS_ASSUME_NONNULL_END
