//
//  CCPushBusiness.h
//  CCPushDemo
//
//  Created by cuiRobim on 16/4/27.
//  Copyright © 2016年 cuiRobin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPushProtocol.h"
//日志输出统一用
#ifdef DEBUG
#define CCPushLog(...) NSLog(__VA_ARGS__);
#else
#define CCPushLog(...);
#endif

typedef void (^CCPushBusinessErrorBlock) (NSError *_Nullable error);
typedef void (^CCPushBusinessRegisterFinishedBlock) (id _Nullable clientID);
typedef void (^CCPushBusinessExtraBlock) (id _Nullable info);

@interface CCPushBusiness : NSObject<CCPushProtocol>
@property(nonnull,copy)CCPushBusinessErrorBlock blockError;
@property(nonnull,copy)CCPushBusinessRegisterFinishedBlock blockFinished;
@property(nonnull,copy)CCPushBusinessExtraBlock blockExtra;

@end
