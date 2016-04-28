//
//  CCGeTuiPushBussiness.m
//  CCPushDemo
//
//  Created by cuiRobim on 16/4/27.
//  Copyright © 2016年 cuiRobin. All rights reserved.
//

#import "CCGeTuiPushBussiness.h"
#import <GTSDK/GeTuiSdk.h>

#define kGtAppId           @"rHFJPpkbGY80dwVgFpne54"
#define kGtAppKey          @"MioEhAfAo66P853ZtVEjK5"
#define kGtAppSecret       @"G0aBqAD6t79JfzTB6Z5lo5"

@interface CCGeTuiPushBussiness()<GeTuiSdkDelegate>
{
    CCPushBusiness_GeTuiCallBlock _blockCall;
}
@end
@implementation CCGeTuiPushBussiness
- (void)setBlockCall:(CCPushBusiness_GeTuiCallBlock)blockCall {
    _blockCall = blockCall;
}

- (CCPushBusiness_GeTuiCallBlock)blockCall {
    return _blockCall;
}
- (void)registerPushServiceProvider {
    [super registerPushServiceProvider];
    [GeTuiSdk startSdkWithAppId:kGtAppId appKey:kGtAppKey appSecret:kGtAppSecret delegate:self];
}

+ (NSString *)registerServiceWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [super registerServiceWithDeviceToken:deviceToken];
    // [3]:向个推服务器注册deviceToken
    [GeTuiSdk registerDeviceToken:token];
    return token;
}

+ (void)editBadge:(NSInteger)badge {
    [super editBadge:badge];
    [GeTuiSdk setBadge:badge]; //同步本地角标值到服务器
}

+ (void)resetBadge {
    [super resetBadge];
    [GeTuiSdk resetBadge]; //同步本地角标值到服务器

}

+ (void)resumeService {
    [GeTuiSdk resume];
}

- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId {
    if (self.blockFinished) {
        self.blockFinished(clientId);
    }
}

/**
 *  SDK通知收到个推推送的透传消息
 *
 *  @param payloadData 推送消息内容
 *  @param taskId      推送消息的任务id
 *  @param msgId       推送消息的messageid
 *  @param offLine     是否是离线消息，YES.是离线消息
 *  @param appId       应用的appId
 */
- (void)GeTuiSdkDidReceivePayloadData:(NSData *)payloadData andTaskId:(NSString *)taskId andMsgId:(NSString *)msgId andOffLine:(BOOL)offLine fromGtAppId:(NSString *)appId {
    if (self.blockCall) {
        NSString *payloadMessage = [[self class] payloadMessageInData:payloadData];
        self.blockCall(payloadMessage,taskId,msgId,offLine,appId);
    }
}

- (void)GeTuiSdkDidSendMessage:(NSString *)messageId result:(int)result {
    
}

/**
 *  SDK遇到错误消息返回error
 *
 *  @param error SDK内部发生错误，通知第三方，返回错误
 */
- (void)GeTuiSdkDidOccurError:(NSError *)error {
    if (self.blockError) {
        self.blockError(error);
    }
}

@end
