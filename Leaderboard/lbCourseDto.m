//
//  lbCourseDto.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbCourseDto.h"

@implementation lbCourseDto

@synthesize courseId;
@synthesize courseName;
@synthesize par;
@synthesize isNineHole;
@synthesize teeColour;
@synthesize courseImageRef;
@synthesize slopeIndex;
@synthesize courseHoleMap;

- (void) initCourseHoleMap:(NSDictionary *)holeMap {
    courseHoleMap = [NSMutableArray array];
    int holeCount = 18;
    if( isNineHole) {
        holeCount = 9;
    }
    for (int key = 0; key < holeCount; key++) {
        NSString *keyStr = [NSString stringWithFormat:@"%d", key];
        NSDictionary *hole = [holeMap objectForKey: keyStr];
        if (hole != NULL) {
            // TODO maybe parse the object to be a domain entity
            //lbCourseHoleDto *courseHole = [[lbCourseDto alloc] initWithDictionary: hole];
            [courseHoleMap addObject: hole];
        } else {
            // TODO maybe handle this a little fucking better!
            NSLog(@"course hole is null!");
        }

    }
    
//    NSArray *sortedKeys = [[holeMap allKeys] sortedArrayUsingSelector: @selector(compare:)];
//    courseHoleMap = [NSMutableArray array];
//    for (NSString *key in sortedKeys) {
//        [courseHoleMap addObject: [holeMap objectForKey: key]];
//    }
    NSLog(@"I'm here!");
}

+ (lbCourseDto *) initWithAttributes: (NSDictionary *) jsonResult {
    lbCourseDto *course = [[lbCourseDto alloc] init];
    [course setCourseId: jsonResult[@"id"]];
    [course setCourseName: jsonResult[@"courseName"]];
    [course setPar: [jsonResult[@"par"] longValue]];
    if([course par] > 37) {
        [course setIsNineHole: FALSE];
    } else {
        [course setIsNineHole: TRUE];
    }
    [course setTeeColour: jsonResult[@"teeColour"]];
    [course setCourseImageRef: jsonResult[@"courseImageRef"]];
    [course setSlopeIndex: [jsonResult[@"slopeIndex"] doubleValue]];

//    "nineHole": false,
//    "courseName": "test course",
//    "club": {
//        "address": null,
//        "clubName": "test club",
//        "managerName": null,
//        "dressCodePolicy": null,
//        "greenKeeperName": null,
//        "proGolferName": null,
//        "id": "64fe56f5-383b-4697-bead-dd0dd42eead0"
//    },
//    "teeColour": "WHITE",
//    "slopeIndex": 114.5,
//    "par": 72,
//    "courseImageRef": "test course image reference",
//    "courseHoleList": null,
//    "id": "ac48d44d-8494-4f0c-9694-f515b7eca3fb"
    return course;
}

@end
