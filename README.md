

####简书地址：[点击这里：简书地址](http://www.jianshu.com/users/3930920b505b/latest_articles)
##先来个广告：
####[高仿内涵段子app源码，一个你值得收藏的项目源码https://github.com/Charlesyaoxin/NeiHanDuanZI](https://github.com/Charlesyaoxin/NeiHanDuanZI)
#####进入正题
![单例.png](http://upload-images.jianshu.io/upload_images/939127-c6892ac488a4caf7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#####贴上代码

######第1种方法(最不常用的)
``` 
#import "LaoSiJiManager.h"

/**
 *  设置为static，修饰全局变量，作用域仅限于当前文件内部，在程序运行过程中只有一份内存
 */
static LaoSiJiManager *_singleton = nil;
@implementation LaoSiJiManager

#pragma mark - 最不常用的单例创建方法
/**
 *  最不常用的单例创建方法
 */
+ (instancetype)sharedManager_DonotUse {
    return _singleton;
}

/**
 *  只要这个类一被加载到oc运行时环境中，就会调用一次load，而且这个类只会加载一次
 */
+ (void)load {
    // 相当于+initialize
    _singleton = [[self alloc] init];
}

/**
 *  initialize方法只会在第一次使用这个类的时候调用
 */
+ (void)initialize {
    _singleton = [[self alloc] init];
}

/**
 *  重写
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
 *  重写
 */
- (id)copyWithZone:(NSZone *)zone {
    return _singleton;
}

@end
```
######第2种方法(GCD)
```
/**
 *  设置为static，修饰全局变量，作用域仅限于当前文件内部，在程序运行过程中只有一份内存
 */
static LaoSiJiManager2 *_singleton = nil;
@implementation LaoSiJiManager2

#pragma mark - 使用GCD创建单例
/**
 *  使用GCD创建单例对象
 */
+ (instancetype)sharedManager_GCD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[self alloc] init];
    });
    return _singleton;
}

/**
 *  重写
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [super allocWithZone:zone];
    });
    return _singleton;
}

/**
  *  重写
  */
- (id)copyWithZone:(NSZone *)zone {
    return _singleton;
}
```

第3种方法(线程锁)
``` 
/**
 *  设置为static，修饰全局变量，作用域仅限于当前文件内部，在程序运行过程中只有一份内存
 */
static LaoSiJiManager3 *_singleton = nil;
@implementation LaoSiJiManager3

#pragma mark - 使用线程锁创建单例
/**
 *  使用线程锁来创建单例
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
 *  重写
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
 *  重写
 */
- (id)copyWithZone:(NSZone *)zone {
    return _singleton;
}
```

第4种方法(宏定义)
```
.h 文件
#import <Foundation/Foundation.h>

#define CharlesSingletonH(name) + (instancetype)shared##name;

@interface LaoSiJiManager4 : NSObject 

CharlesSingletonH(LaoSiJiManager4)

@end
```
```
.m文件
#import "LaoSiJiManager4.h"

@implementation LaoSiJiManager4

#define CharlesSingletonM(name) \
static id _singleton; \
+ (id)allocWithZone:(struct _NSZone *)zone { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken,^{ \
        _singleton = [super allocWithZone:zone]; \
    }); \
    return _singleton; \
} \
+ (instancetype)shared##name { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken,^{ \
        _singleton = [[[self class] alloc] init]; \
    }); \
    return _singleton; \
} \
- (id)copyWithZone:(NSZone *)zone { \
    return _singleton; \
} \
\

CharlesSingletonM(LaoSiJiManager4)

@end
```
