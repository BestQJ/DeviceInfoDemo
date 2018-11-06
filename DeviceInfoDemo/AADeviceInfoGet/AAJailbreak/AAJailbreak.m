//
//  AAJailbreak.m
//  ArticleAssem
//
//  Created by 乔杰 on 2018/10/22.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AAJailbreak.h"
#include <stdio.h>
#include <stdlib.h>

@implementation AAJailbreak

+ (BOOL)isJailbroken {
    FILE *f = fopen("/bin/bash", "r");
    BOOL isJailbroken = NO;
    if (f != NULL) {
      
        isJailbroken = YES;
   
    }else {
     
        isJailbroken = NO;
    }
    fclose(f);
    return isJailbroken;
}

@end
