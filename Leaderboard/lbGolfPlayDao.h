//
//  lbGolfPlayDao.h
//  Leaderboard
//
//  Created by John D. Gaffney on 2/12/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface lbGolfPlayDao : NSObject

+(void) loadScorecardForCourseId: (NSString*) courseId andScorerId: (NSString*) scorerId;

@end
