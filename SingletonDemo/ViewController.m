//
//  ViewController.m
//  Singleton
//
//  Created by Charles on 16/9/13.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import "ViewController.h"
#import "LaoSiJiManager.h"
#import "LaoSiJiManager2.h"
#import "LaoSiJiManager3.h"
#import "LaoSiJiManager4.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  单例
     */
    
    // 第1种
    NSLog(@"--1:%@", [LaoSiJiManager sharedManager_DonotUse]);
    NSLog(@"--2:%@\n\n", [LaoSiJiManager sharedManager_DonotUse]);
    
    // 第2种
    NSLog(@"--1:%@", [LaoSiJiManager2 sharedManager_GCD]);
    NSLog(@"--2:%@\n\n", [LaoSiJiManager2 sharedManager_GCD]);
    
    // 第3种
    NSLog(@"--1:%@", [LaoSiJiManager3 sharedManager_Sync]);
    NSLog(@"--2:%@\n\n", [LaoSiJiManager3 sharedManager_Sync]);
 
    // 第4种
    NSLog(@"--1:%@", [LaoSiJiManager4 sharedLaoSiJiManager4]);
    NSLog(@"--2:%@\n\n", [LaoSiJiManager4 sharedLaoSiJiManager4]);
}

@end
