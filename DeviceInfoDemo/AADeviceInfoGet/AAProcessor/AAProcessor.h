//
//  AAProcessor.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAProcessor : NSObject

//当前项目进程数量
+ (NSInteger)processorsNumber;
//当前项目活跃进程数量
+ (NSInteger)activeProcessorsNumber;
//正在使用的应用程序的cpu使用率
+ (CGFloat)cpuUsageForApp;
//当前活跃进程列表
+ (NSArray *)activeProcesses;
//当前活跃进程数
+ (NSInteger)numberOfActiveProcesses;

@end

NS_ASSUME_NONNULL_END
