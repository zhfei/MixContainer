//
//  AppJSModel.m
//  MixContainer
//
//  Created by zhoufei on 2023/6/27.
//

#import "AppJSModel.h"

@implementation AppJSModel
- (NSDictionary *)QRCodeScan:(NSDictionary *)param {
    NSLog(@"param: %@",param);
    return @{@"name":@"jack"};
}
@end
