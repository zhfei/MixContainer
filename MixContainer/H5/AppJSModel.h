//
//  AppJSModel.h
//  MixContainer
//
//  Created by zhoufei on 2023/6/27.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
 
@protocol JSNativeProtocol <JSExport>
 
- (NSDictionary *)QRCodeScan:(NSDictionary *)param;
 
@end
 
@interface AppJSModel : NSObject <JSNativeProtocol>
 
@end
