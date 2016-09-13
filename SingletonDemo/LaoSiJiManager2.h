//
//  LaoSiJiManager2.h
//  Singleton
//
//  Created by Charles on 16/9/13.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaoSiJiManager2 : NSObject

/**
 *  使用GCD创建单例对象
 */
+ (instancetype)sharedManager_GCD;

@end
