//
//  lbCourseDto.h
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lbCourseDto : NSObject

@property (nonatomic) NSString *courseId;
@property (nonatomic) NSString *courseName;
@property (nonatomic) long par;
@property (nonatomic) BOOL isNineHole;
@property (nonatomic) NSString *teeColour;
@property (nonatomic) double slopeIndex;
@property (nonatomic) NSString *courseImageRef;
@property (nonatomic) NSMutableArray *courseHoleMap;

+(lbCourseDto *) initWithAttributes: (NSDictionary *) jsonResult;

-(void) initCourseHoleMap: (NSDictionary *) holeMap;

//"nineHole": false,
//"courseName": "test course",
//"club": {
//    "address": null,
//    "clubName": "test club",
//    "managerName": null,
//    "dressCodePolicy": null,
//    "greenKeeperName": null,
//    "proGolferName": null,
//    "id": "64fe56f5-383b-4697-bead-dd0dd42eead0"
//},
//"teeColour": "WHITE",
//"slopeIndex": 114.5,
//"par": 72,
//"courseImageRef": "test course image reference",
//"courseHoleList": null,
//"id": "ac48d44d-8494-4f0c-9694-f515b7eca3fb"
@end
