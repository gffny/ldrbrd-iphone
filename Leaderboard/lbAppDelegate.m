        //
//  lbAppDelegate.m
//  Leaderboard
//
//  Created by John D. Gaffney on 1/7/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbAppDelegate.h"

@implementation lbAppDelegate

@synthesize USER_VALIDATED;
@synthesize BACKEND_ONLINE;
@synthesize errorMessage;
@synthesize initialVC;

@synthesize course;
@synthesize courseMap;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Check if the backend is online
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    [manager setRequestSerializer: requestSerializer];

    [manager GET:@"http://localhost:8080/ldrbrd/check/c_online" parameters:Nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // check if the resposne is valid
        if(responseObject) {
            NSLog(@"status: %@", [responseObject valueForKeyPath:@"statusCode"]);
            if([[responseObject valueForKeyPath:@"statusCode"] isEqualToString: @"SUCCESS"]) {
                NSLog(@"backend online");
                BACKEND_ONLINE = TRUE;
                [initialVC handleBackendOnline:TRUE withMesssage: NULL];
            } else {
                NSLog(@"backend offline");
                BACKEND_ONLINE = FALSE;
                [initialVC handleBackendOnline:FALSE withMesssage:@"backend offline"];
            }
        } else {
            NSLog(@"response object was null");
            BACKEND_ONLINE = FALSE;
            [initialVC handleBackendOnline:FALSE withMesssage:@"backend offline"];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        BACKEND_ONLINE = FALSE;
        [initialVC handleBackendOnline:FALSE withMesssage: @"ERROR"];
    }];
    // Override point for customization after application launch.
    //showLoadingScreen
    
    return YES;
}

- (void) setInitialVC:(lbInitialViewController *) passedInitialVC
{
    initialVC = passedInitialVC;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

///methods required to save and restore application state via UIKit
-(BOOL)application:(UIApplication *)application shouldRestoreApplicationState: (NSCoder *) coder
{
    return YES;
}

-(BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}

@end
