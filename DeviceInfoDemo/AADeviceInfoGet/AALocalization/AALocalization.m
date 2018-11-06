//
//  AALocalization.m
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AALocalization.h"

@implementation AALocalization

+ (NSString *)language {
    return [[NSLocale preferredLanguages] objectAtIndex:0];
}

+ (NSString *)timeZone {
    return [[NSTimeZone systemTimeZone] name];
}

+ (NSString *)currencySymbol {
    return [[NSLocale currentLocale] objectForKey:NSLocaleCurrencySymbol];
}

+ (NSString *)currencyCode {
    return [[NSLocale currentLocale] objectForKey:NSLocaleCurrencyCode];
}

+ (NSString *)country {
    return [[NSLocale currentLocale] localeIdentifier];
}

+ (NSString *)measurementSystem {
    return [[NSLocale currentLocale] objectForKey:NSLocaleMeasurementSystem];
}

@end
