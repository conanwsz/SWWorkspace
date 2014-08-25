//
//  AppDelegate.m
//  WaxPatch
//
//  Created by Wang Shunzhou on 2012-08-20.
//  Copyright (c) 2014 Wang Shunzhou. All rights reserved.
//

#import "AppDelegate.h"
#import "lauxlib.h"
#import "wax.h"
#import "ZipArchive.h"
#import "MainViewController.h"
#import <AFNetworking/AFNetworking.h>

static NSString *patchDic;
static NSString *patchPath;
static NSString *patchURLStr = @"http://bcs.duapp.com/user-res/patch.zip";


@implementation AppDelegate
@synthesize window = _window;

- (id)init {
    if(self = [super init]) {
        patchDic = [HOME_LIBRARY_PATH stringByAppendingPathComponent:luaPatchDir];
        patchPath = [patchDic stringByAppendingPathComponent:@"patch.zip"];
        CREATE_DIRECTORY(patchDic);
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self patch];
    
    self.window.rootViewController = [[MainViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)unzipPatch{
    ZipArchive *zip = [[ZipArchive alloc] init];
    [zip UnzipOpenFile:patchPath];
    [zip UnzipFileTo:patchDic overWrite:YES];
    wax_start("patch", nil);
    self.window.rootViewController = [[MainViewController alloc] init];
    [self.window makeKeyAndVisible];
}

- (void)patch{
    NSString *pp = [[NSString alloc ] initWithFormat:@"%@/?.lua;%@/?/init.lua;", patchDic, patchDic];
    setenv(LUA_PATH, [pp UTF8String], 1);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:patchURLStr]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:[patchDic stringByAppendingPathComponent:@"patch.zip"] append:YES];
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead){
        DDLogVerbose(@"%lld",totalBytesRead);
    }];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        [self unzipPatch];
    } failure:^(AFHTTPRequestOperation *operation, NSError* error){
        DDLogError(@"%@",error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}

@end
