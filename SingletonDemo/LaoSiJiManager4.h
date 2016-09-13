//
//  LaoSiJiManager4.h
//  Singleton
//
//  Created by Charles on 16/9/13.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CharlesSingletonH(name) + (instancetype)shared##name;

@interface LaoSiJiManager4 : NSObject 

CharlesSingletonH(LaoSiJiManager4)

@end
