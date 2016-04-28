//
//  CCPushBusiness_GeTui.h
//  
//
//  Created by cuiRobim on 16/4/28.
//
//

#import "CCPushBusiness.h"

typedef void (^CCPushBusiness_GeTuiCallBlock)(NSString *_Nullable payloadMessage,NSString *_Nullable taskID,NSString *_Nullable msgId,BOOL offLine,NSString *_Nullable appId);
@interface CCPushBusiness ()
@property(nonnull,copy)CCPushBusiness_GeTuiCallBlock blockCall;
@end
