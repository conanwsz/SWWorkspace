//
//  NSData+Hex.m
//  manpower
//
//  Created by WangShunzhou on 14-8-19.
//  Copyright (c) 2014年 WHZM. All rights reserved.
//

#import "NSString+SWHex.h"

@implementation NSString (SWHex)
-(NSData*) dataFromBytesString {
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= self.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [self substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}
@end

