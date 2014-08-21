//
//  NSData+Hex.h
//  manpower
//
//  Created by WangShunzhou on 14-8-19.
//  Copyright (c) 2014年 WHZM. All rights reserved.
//


@interface NSNumber (SWHex)
-(NSUInteger)decValueOfHex;   // e.g. Change Dec 15 to Hex 15 is Dec 21
-(NSString *)hexString;
@end