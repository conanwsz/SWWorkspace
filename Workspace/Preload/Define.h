//
//  Define.h
//  WaxPatch
//
//  Created by WangShunzhou on 14-8-18.
//  Copyright (c) 2014年 WHZM. All rights reserved.
//

#ifndef WaxPatch_Define_h
#define WaxPatch_Define_h

#import <CocoaLumberjack/CocoaLumberjack.h>

#if DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_OFF;
#endif

#pragma mark - Singleton

#define DEFINE_SINGLETON_FOR_HEADER(className) \
+ (className *)shared##className;

#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

#pragma mark - Color

#define UIColorFromRGBA(rgb,a) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:a]
#define UIColorFromRGB(rgb) UIColorFromRGBA(rgb,1.0f)

#pragma mark - Device

#define IS_IOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568) < DBL_EPSILON)

#pragma mark - File System

#define CREATE_DIRECTORY(path) \
\
if (![[NSFileManager defaultManager] fileExistsAtPath:path]) { \
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil]; \
}
#pragma mark - Other
#define ccp CGPointMake
#define ccr CGRectMake

#endif
