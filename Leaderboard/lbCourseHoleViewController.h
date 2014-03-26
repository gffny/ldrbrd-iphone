//
//  lbCourseHoleViewController.h
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lbCourseDto.h"

@interface lbCourseHoleViewController : UIViewController

@property (nonatomic) lbCourseDto *course;
@property (nonatomic) NSArray *courseHoleList;
@property (nonatomic) int holePointer;
@property (nonatomic) NSNumber *holeScore;
@property (nonatomic) NSMutableArray *scoreArray;

@end
