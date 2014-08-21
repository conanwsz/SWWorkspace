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

#define WAX_PATCH_URL @"http://raw.github.com/mmin18/WaxPatch/master/patch/patch.zip"
static NSString *patchDic;

@implementation AppDelegate
@synthesize window = _window;

- (id)init {
    if(self = [super init]) {
        patchDic = [HOME_LIBRARY_PATH stringByAppendingPathComponent:luaPatchDir];
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

-(void)patch{
    NSString *pp = [[NSString alloc ] initWithFormat:@"%@/?.lua;%@/?/init.lua;", patchDic, patchDic];
    setenv(LUA_PATH, [pp UTF8String], 1);
    wax_start("patch", nil);
}
/*
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == [alertView firstOtherButtonIndex]) {
        // you probably want to change this url before run
        NSURL *patchUrl = [NSURL URLWithString:WAX_PATCH_URL];
        NSData *data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:patchUrl] returningResponse:NULL error:NULL];
        if(data) {
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

        NSString *patchZip = [doc stringByAppendingPathComponent:@"patch.zip"];
        [data writeToFile:patchZip atomically:YES];

        NSString *dir = [doc stringByAppendingPathComponent:@"lua"];
        [[NSFileManager defaultManager] removeItemAtPath:dir error:NULL];
        [[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:NULL];

        ZipArchive *zip = [[ZipArchive alloc] init];
        [zip UnzipOpenFile:patchZip];
        [zip UnzipFileTo:dir overWrite:YES];
        
        NSString *pp = [[NSString alloc ] initWithFormat:@"%@/?.lua;%@/?/init.lua;", dir, dir];
        setenv(LUA_PATH, [pp UTF8String], 1);
        wax_start("patch", nil);
        
        // reinit MainViewController again
        self.window.rootViewController =  [[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
        [self.window makeKeyAndVisible];
        } else {
            [[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"Fail to download wax patch from %@", patchUrl] delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil] show];
        }
    }
}
*/
@end
