//
//  AALocalization.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AALocalization : NSObject

//系统语言
+ (NSString *)language;
//系统时区
+ (NSString *)timeZone;
//系统的货币符号
+ (NSString *)currencySymbol;
//系统的货币代码
+ (NSString *)currencyCode;
//所在国家地区
+ (NSString *)country;
//测量系统
+ (NSString *)measurementSystem;

@end

NS_ASSUME_NONNULL_END
