//
//  LaoSiJiManager.h
//  Singleton
//
//  Created by Charles on 16/9/13.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaoSiJiManager : NSObject

/**
 *  最不常用的单例创建方法
 */
+ (instancetype)sharedManager_DonotUse;

@end
