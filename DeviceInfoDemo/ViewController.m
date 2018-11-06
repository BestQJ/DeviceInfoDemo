//
//  ViewController.m
//  DeviceInfoDemo
//
//  Created by 乔杰 on 2018/11/6.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "ViewController.h"
#import "AASystemInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", [AASystemInfo systemInfo]);

}


@end
