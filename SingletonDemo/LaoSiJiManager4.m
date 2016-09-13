//
//  LaoSiJiManager4.m
//  Singleton
//
//  Created by Charles on 16/9/13.
//  Copyright © 2016年 Charles. All rights reserved.
//

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
