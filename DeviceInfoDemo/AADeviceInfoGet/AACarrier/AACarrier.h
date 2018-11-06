//
//  AACarrier.h
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AACarrier : NSObject

//运营商名称
+ (NSString *)carrierName;
//运营商ISO国家代码
+ (NSString *)carrierISOCountryCode;
//运营商移动国家代码
+ (NSString *)carrierMobileCountryCode;
//运营商移动网络代码
+ (NSString *)carrierMobileNetworkCode;
//检查运营商是否允许VOIP
+ (BOOL)carrierAllowsVOIP;

@end

NS_ASSUME_NONNULL_END
