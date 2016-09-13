//
//  LaoSiJiManager.m
//  Singleton
//
//  Created by Charles on 16/9/13.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import "LaoSiJiManager.h"

/**
 *  设置为static，修饰全局变量，作用域仅限于当前文件内部，在程序运行过程中只有一份内存
 */
static LaoSiJiManager *_singleton = nil;
@implementation LaoSiJiManager

#pragma mark - 最不常用的单例创建方法
/**
 *  最不常用的单例创建方法
 */
+ (instancetype)sharedManager_DonotUse {
    return _singleton;
}

/**
 *  只要这个类一被加载到oc运行时环境中，就会调用一次load，而且这个类只会加载一次
 */
+ (void)load {
    // 相当于+initialize
    _singleton = [[self alloc] init];
}

/**
 *  initialize方法只会在第一次使用这个类的时候调用
 */
+ (void)initialize {
    _singleton = [[self alloc] init];
}

/**
 *  重写
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (_singleton == nil) {
        @synchronized(self) {
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
