//
//  NSData+Hex.m
//  manpower
//
//  Created by WangShunzhou on 14-8-19.
//  Copyright (c) 2014年 WHZM. All rights reserved.
//

#import "NSData+SWHex.h"
@implementation NSData (SWHex)
-(NSString *) bytesString{
    NSString *retStr = @"";
    
    Byte *revByte =  (Byte *)[self bytes];
    for (int i=0; i<[self length]; i++) {
        retStr = [retStr stringByAppendingFormat:@"%02X",revByte[i]];
    }
    return retStr;
}

-(NSInteger) bytesToDecValue:(int)num1, ...{
    Byte *bytes = (Byte*)[self bytes];
    int length = [self length];
    int eachNum;
    va_list argumentList;
    int value = 0;
    int k = 1;
    
    //    value = bytes[num1];
    va_start(argumentList, num1);
    while ((eachNum = va_arg(argumentList, int))) {
        for (int i= length-1 ; i > eachNum; i--) {
            k *= 256;
        }
        value += bytes[eachNum] * k;
        va_end(argumentList);
    }
    
    return value;
}

@end