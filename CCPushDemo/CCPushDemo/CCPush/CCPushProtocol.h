//
//  CCPushProtocol.h
//  CCPushDemo
//
//  Created by cuiRobim on 16/4/27.
//  Copyright © 2016年 cuiRobin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCPushProtocol <NSObject>
+ (void)registerPushServiceProvider;
- (void)registerPushServiceProvider;
+ (void)resumeService;
+ (NSString *_Nullable)registerServiceWithDeviceToken:(NSData *_Nullable)deviceToken;

+ (void)resetBadge;
+ (void)editBadge:(NSInteger)badge;

+ (NSString *_Nullable)payloadMessageInData:(NSData *_Nullable)payloadData;
@end
