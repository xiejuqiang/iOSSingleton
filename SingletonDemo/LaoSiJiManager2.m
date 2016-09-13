//
//  LaoSiJiManager2.m
//  Singleton
//
//  Created by Charles on 16/9/13.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import "LaoSiJiManager2.h"

/**
 *  设置为static，修饰全局变量，作用域仅限于当前文件内部，在程序运行过程中只有一份内存
 */
static LaoSiJiManager2 *_singleton = nil;
@implementation LaoSiJiManager2

#pragma mark - 使用GCD创建单例
/**
 *  使用GCD创建单例对象
 */
+ (instancetype)sharedManager_GCD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[self alloc] init];
    });
    return _singleton;
}

/**
 *  重写
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [super allocWithZone:zone];
    });
    return _singleton;
}

/**
  *  重写
  */
- (id)copyWithZone:(NSZone *)zone {
    return _singleton;
}

@end
