//
//  NSData+Hex.m
//  manpower
//
//  Created by WangShunzhou on 14-8-19.
//  Copyright (c) 2014年 WHZM. All rights reserved.
//

#import "NSNumber+SWHex.h"

@implementation NSNumber (SWHex)

-(NSUInteger)decValueOfHex{
    //    int length = 0;
    long num = [self longValue];
    long decFac = 1;
    long hexFac = 1;
    long result = 0;
    
    int round = 0;
    int lastDecNum = 0;
    while (YES) {
        if (round>0) {
            hexFac *= 16;
            decFac *= 10;
        }
        if (decFac > num) {
            break;
        }
        
        lastDecNum = (num % (decFac * 10) - lastDecNum) / decFac;
        result += lastDecNum * hexFac;
        
        round++;
    }
    
    return result;
}

-(NSString *)hexString;
{
    long long tmpid = [self longLongValue];
    NSString *nLetterValue;
    NSString *str =@"";
    long long int ttmpig;
    while (YES) {
        ttmpig = tmpid % 16;
        tmpid = tmpid / 16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue=[[NSString alloc]initWithFormat:@"%lld",ttmpig];
                break;
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
        
    }
    return str;
}


@end
