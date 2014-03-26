//
//  lbCourseDao.h
//  Leaderboard
//
//  Created by John D. Gaffney on 2/2/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface lbCourseDao : NSObject

+ (void) loadCourseById: (NSString *) courseId;

@end
