//
//  lbCourseDao.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/2/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbCourseDao.h"
#import "lbCourseDto.h"

@implementation lbCourseDao

+ (void) testAFNetworking {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"id": @"ac48d44d-8494-4f0c-9694-f515b7eca3fb"};
    [manager setRequestSerializer: [AFJSONRequestSerializer serializer]];
    [manager POST:@"http://localhost:8080/ldrbrd/course/courseFromId" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if(responseObject == nil) {
            NSLog(@"error with response");
        } else {
            NSDictionary *payload = responseObject[@"payload"];
            lbCourseDto *course = [lbCourseDto initWithAttributes: payload[@"course"]];
            NSDictionary *courseHoleMap = payload[@"courseHoleMap"];
            NSDictionary *courseHoleList = courseHoleMap[[course courseId]];
            [course initCourseHoleMap: courseHoleList];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
