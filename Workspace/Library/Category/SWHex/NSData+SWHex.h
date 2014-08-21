//
//  NSData+Hex.h
//  manpower
//
//  Created by WangShunzhou on 14-8-19.
//  Copyright (c) 2014年 WHZM. All rights reserved.
//

@interface NSData (SWHex)
-(NSString *) bytesString;
-(NSInteger) bytesToDecValue:(int)num1,...;
@end