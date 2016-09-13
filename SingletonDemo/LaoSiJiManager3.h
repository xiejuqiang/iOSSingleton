//
//  LaoSiJiManager3.h
//  Singleton
//
//  Created by Charles on 16/9/13.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaoSiJiManager3 : NSObject

/**
 *  使用线程锁来创建单例
 */
+ (instancetype)sharedManager_Sync;
@end
