//
//  lbDetailViewController.m
//  Leaderboard
//
//  Created by John D. Gaffney on 1/7/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbDetailViewController.h"
#import "lbAppDelegate.h"
#import "lbCourseDto.h"
#import "lbCourseDao.h"
#import "lbGolfPlayDao.h"

@interface lbDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *courseName;
@property (strong, nonatomic) IBOutlet UILabel *par;
@property (strong, nonatomic) IBOutlet UILabel *teeColourLabel;
@property (strong, nonatomic) IBOutlet UILabel *slopeIndex;

@property (strong, nonatomic) lbCourseDto *course;

@end

@implementation lbDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Add observer
    lbAppDelegate *appDelegate = (lbAppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate addObserver:self forKeyPath:@"course" options:NSKeyValueObservingOptionNew context:NULL];
    self.course = [appDelegate course];
    self.courseName.text = self.course.courseName;
    self.par.text = [NSString stringWithFormat:@"%ld", self.course.par];
    self.teeColourLabel.text = self.course.teeColour;
    self.slopeIndex.text = [NSString stringWithFormat:@"%.1f", self.course.slopeIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playRound:(id)sender forEvent:(UIEvent *)event {
    NSLog(@"play round");
    //check if the course has been chosen

    [self performSegueWithIdentifier:seg_roundDetailToPlayRound sender:self];
}

- (void) observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context {
    if ([keyPath isEqual:@"course"]) {
        lbCourseDto* changedCourse = [change objectForKey:NSKeyValueChangeNewKey];
        // do something with the changedName - call a method or update the UI here
        self.courseName.text = changedCourse.courseName;
        self.par.text = [NSString stringWithFormat: @"%ld", changedCourse.par];
        self.teeColourLabel.text = changedCourse.teeColour;
        self.slopeIndex.text = [NSString stringWithFormat: @"%.1f", changedCourse.slopeIndex];
    }
}

@end
