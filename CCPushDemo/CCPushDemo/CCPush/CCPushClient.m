//
//  CCPushClient.m
//  CCPushDemo
//
//  Created by cuiRobim on 16/4/27.
//  Copyright © 2016年 cuiRobin. All rights reserved.
//

#import "CCPushClient.h"
#import "CCPushBusiness.h"
#import "CCPushBusiness_GeTui.h"
@interface CCPushClient (){
}
@end
@implementation CCPushClient
static NSString *  _className;

+ (void)registerPushServicProviderWithClsName:(NSString * _Nullable)className {
    NSAssert(className!=nil, @"推送服务层的类别不能为空");
    Class Cls = NSClassFromString(className);
    if(![Cls isSubclassOfClass:NSClassFromString(@"CCPushBusiness")])
        NSAssert(YES, @"推送服务层的父类必须是 CCPushBusiness");
    _className =className;
    [self registerPushServiceProvider];
}

+ (id)registerPushServicProviderWithClsName:(NSString *)className
                                        finishedBlock:(void (^)(NSString * clientID))finishedBlock
                                           errorBlock:(void (^)(NSError *error)) errorBlock
                                           extraBlock:(void (^)(id extraInfo)) extraBlock{
    _className = className;
    CCPushBusiness *pushBusiness = [[NSClassFromString(_className) alloc] init];
    pushBusiness.blockFinished = finishedBlock;
    pushBusiness.blockExtra = extraBlock;
    pushBusiness.blockError = errorBlock;
    [pushBusiness registerPushServiceProvider];
    return pushBusiness;
}

+ (id)registerGTPushServicProviderWithClsName:(NSString *)className
                              finishedBlock:(void (^)(NSString * clientID))finishedBlock
                                 errorBlock:(void (^)(NSError *error)) errorBlock
                                 extraBlock:(void (^)(id extraInfo)) extraBlock
                                  GTCallBlock:(void(^)(NSString * payloadMessage,NSString * taskID,NSString * msgId,BOOL offLine,NSString * appId) )gtCallBlock {
    CCPushBusiness *pushBusiness = [self registerPushServicProviderWithClsName:className
                                                                 finishedBlock:finishedBlock
                                                                    errorBlock:errorBlock
                                                                    extraBlock:extraBlock];
    pushBusiness.blockCall = gtCallBlock;
    return pushBusiness;
    
}


+ (void)registerPushServiceProvider {
    Class cls = NSClassFromString(_className);
    [cls registerPushServiceProvider];
}

- (void)registerPushServiceProvider {
    Class cls = NSClassFromString(_className);
    [cls registerPushServiceProvider];
}

+ (void)resumeService {
    Class cls = NSClassFromString(_className);
    [cls resumeService];
}


+ (NSString *_Nullable)registerServiceWithDeviceToken:(NSData *_Nullable)deviceToken {
    Class cls = NSClassFromString(_className);
    return [cls registerServiceWithDeviceToken:deviceToken];
}

+ (void)resetBadge {
    Class cls = NSClassFromString(_className);
    [cls resetBadge];
}

+ (void)editBadge:(NSInteger)badge {
    Class cls = NSClassFromString(_className);
    [cls editBadge:badge];
}

+ (NSString *_Nullable)payloadMessageInData:(NSData *_Nullable)payloadData {
    Class cls = NSClassFromString(_className);
    return [cls payloadMessageInData:payloadData];
}
@end
