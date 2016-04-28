//
//  CCPushBusiness.m
//  CCPushDemo
//
//  Created by cuiRobim on 16/4/27.
//  Copyright © 2016年 cuiRobin. All rights reserved.
//

#import "CCPushBusiness.h"
#import <UIKit/UIKit.h>
@implementation CCPushBusiness
/** 注册APNS */
+ (void)registerRemoteNotification {
    // 判读系统版本是否是“iOS 8.0”以上
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ||
        [UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        
        // 定义用户通知类型(Remote.远程 - Badge.标记 Alert.提示 Sound.声音)
        UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        
        // 定义用户通知设置
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        
        // 注册用户通知 - 根据用户通知设置
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    } else { // iOS8.0 以前远程推送设置方式
        // 定义远程通知类型(Remote.远程 - Badge.标记 Alert.提示 Sound.声音)
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
        
        // 注册远程通知 -根据远程通知类型
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
    }
}

+ (void)registerPushServiceProvider {
    [self registerRemoteNotification];
}

- (void)registerPushServiceProvider {
    [[self class] registerRemoteNotification];
}

+ (void)resumeService {
    
}

+ (void)resetBadge {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0]; // APP 清空角标
}

+ (void)editBadge:(NSInteger)badge {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge]; //APP 显示角标需开发者调用系统方法进行设置
}

+ (NSString *)tokenInDeviceToken:(NSData *)deviceToken {
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    CCPushLog(@"\n>>>[DeviceToken Success]:%@\n\n", token);
    return token;
}

+ (NSString *)registerServiceWithDeviceToken:(NSData *)deviceToken {
    NSString *token =[self tokenInDeviceToken:deviceToken];
    CCPushLog(@"\n>>>[DeviceToken Arrival]:%@\n\n", token);
    return token;
}

+ (NSString *)payloadMessageInData:(NSData *)payloadData {
    NSString *payloadMsg = nil;
    if (payloadData) {
        payloadMsg = [[NSString alloc] initWithBytes:payloadData.bytes
                                              length:payloadData.length
                                            encoding:NSUTF8StringEncoding];
    }
    CCPushLog(@"\n>>>[payloadMsg ]:%@\n\n", payloadMsg);

    return payloadMsg;
}
@end
