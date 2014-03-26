//
//  lbGolfPlayDao.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/12/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbGolfPlayDao.h"
#import "lbAppDelegate.h"

@implementation lbGolfPlayDao

+(void) loadScorecardForCourseId: (NSString*) courseId andScorerId: (NSString*) scorerId {

    if(courseId && scorerId) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager setRequestSerializer: [AFJSONRequestSerializer serializer]];
        NSDictionary *params = @{ @"courseId" : courseId, @"scoreKeeperId" : scorerId };
        [manager POST:@"http://localhost:8080/ldrbrd/playgolf/noncompetitionscorecard" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if(responseObject == nil) {
                NSLog(@"error with response");
            } else {
                NSDictionary *payload = responseObject[@"payload"];
                NSDictionary *golferScorecardMap = payload[@"golferScorecardMap"];
                NSDictionary *scorecardId = golferScorecardMap[scorerId];
                //[course initCourseHoleMap: courseHoleList];
                //[appDelegate setCourse: course];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    } else {
        NSLog(@"Error here!");
    }
}

@end
