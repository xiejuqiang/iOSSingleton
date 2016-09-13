//
//  LaoSiJiManager3.m
//  Singleton
//
//  Created by Charles on 16/9/13.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import "LaoSiJiManager3.h"

/**
 *  设置为static，修饰全局变量，作用域仅限于当前文件内部，在程序运行过程中只有一份内存
 */
static LaoSiJiManager3 *_singleton = nil;
@implementation LaoSiJiManager3

#pragma mark - 使用线程锁创建单例
/**
 *  使用线程锁来创建单例
 */
+ (instancetype)sharedManager_Sync {
    // 如果单例对象还未创建，那么继续执行
    if (_singleton == nil) {
        // 上锁，确保同一时间只有一人开锁
        @synchronized (self) {
            if (_singleton == nil) {
                _singleton = [[self alloc] init];
            }
        }
    }
    return _singleton;
}

/**
 *  重写
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    // 如果单例对象还未创建，那么继续执行
    if (_singleton == nil) {
        // 上锁，确保同一时间只有一人开锁
        @synchronized (self) {
            if (_singleton == nil) {
                _singleton = [super allocWithZone:zone];
            }
        }
    }
    return _singleton;

}

/**
 *  重写
 */
- (id)copyWithZone:(NSZone *)zone {
    return _singleton;
}

@end
