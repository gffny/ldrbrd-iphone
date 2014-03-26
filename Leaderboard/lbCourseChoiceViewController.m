//
//  lbCourseChoiceViewController.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/5/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbCourseChoiceViewController.h"
#import "lbCourseDao.h"

@interface lbCourseChoiceViewController ()

@end

@implementation lbCourseChoiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)courseChosen:(id)sender forEvent:(UIEvent *)event {
    NSLog(@"course chosen");
    [lbCourseDao loadCourseById:@"ac48d44d-8494-4f0c-9694-f515b7eca3fb"];
    [self performSegueWithIdentifier:seg_courseChoiceToCourseDetail sender:self];
}

@end
