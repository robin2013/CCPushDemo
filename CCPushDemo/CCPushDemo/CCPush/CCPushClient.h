//
//  CCPushClient.h
//  CCPushDemo
//
//  Created by cuiRobim on 16/4/27.
//  Copyright © 2016年 cuiRobin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPushProtocol.h"
@interface CCPushClient : NSObject<CCPushProtocol>
+ (void)registerPushServicProviderWithClsName:(NSString * _Nullable)className;

+ (id _Nullable)registerPushServicProviderWithClsName:(NSString * _Nullable)className
                                        finishedBlock:(void (^ _Nullable)(NSString * _Nullable clientID))finishedBlock
                                           errorBlock:(void (^_Nullable)(NSError *_Nullable error)) errorBlock
                                           extraBlock:(void (^_Nullable )(id _Nullable extraInfo)) extraBlock;

+ (id _Nullable)registerGTPushServicProviderWithClsName:(NSString * _Nullable)className
                                          finishedBlock:(void (^ _Nullable)(NSString * _Nullable clientID))finishedBlock
                                             errorBlock:(void (^_Nullable)(NSError *_Nullable error)) errorBlock
                                             extraBlock:(void (^_Nullable )(id _Nullable extraInfo)) extraBlock
                                            GTCallBlock:(void(^_Nullable)(NSString *_Nullable payloadMessage,
                                                                          NSString *_Nullable taskID,
                                                                          NSString *_Nullable msgId,
                                                                          BOOL offLine,
                                                                          NSString *_Nullable appId) )gtCallBlock ;
@end
