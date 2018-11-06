//
//  AAAccessory.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAAccessory : NSObject

//检查是否有附件插入
+ (BOOL)accessoriesPluggedIn;
//检查插入附件的数量
+ (NSInteger)numberOfAccessoriesPluggedIn;
//检查耳机是否插好了
+ (BOOL)isHeadphonesAttached;

@end

NS_ASSUME_NONNULL_END
