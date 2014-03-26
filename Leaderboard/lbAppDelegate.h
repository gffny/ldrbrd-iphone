//
//  lbAppDelegate.h
//  Leaderboard
//
//  Created by John D. Gaffney on 1/7/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "lbCourseDto.h"
#import "lbInitialViewController.h"

@interface lbAppDelegate : UIResponder <UIApplicationDelegate>

-(void) setInitialVC: (lbInitialViewController *) initialVC;

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) BOOL USER_VALIDATED;
@property (nonatomic) BOOL BACKEND_ONLINE;

@property (strong, nonatomic) lbInitialViewController *initialVC;
@property (nonatomic) NSString *errorMessage;
@property (nonatomic) lbCourseDto *course;
@property (nonatomic) NSDictionary *courseMap;

@end
