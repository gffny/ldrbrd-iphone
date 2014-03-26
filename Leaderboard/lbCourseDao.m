//
//  lbCourseDao.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/2/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbCourseDao.h"
#import "lbCourseDto.h"
#import "lbAppDelegate.h"

@implementation lbCourseDao

+ (void) loadCourseById: (NSString *) courseId {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer: [AFJSONRequestSerializer serializer]];
    lbAppDelegate *appDelegate = (lbAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSDictionary *params = @{@"id": courseId };
    [manager POST:@"http://localhost:8080/ldrbrd/course/coursefromid" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(responseObject == nil) {
            NSLog(@"error with response");
        } else {
            NSDictionary *payload = responseObject[@"payload"];
            lbCourseDto *course = [[lbCourseDto alloc] initWithCourseDetails: payload[@"course"]];
            NSDictionary *courseHoleMap = payload[@"courseHoleMap"];
            NSDictionary *courseHoleList = courseHoleMap[[course courseId]];
            [course initCourseHoleMap: courseHoleList];
            [appDelegate setCourse: course];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
