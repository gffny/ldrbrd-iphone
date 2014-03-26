//
//  lbCourseHoleViewController.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/4/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbCourseHoleViewController.h"
#import "lbRoundOverviewVC.h"
#import "lbAppDelegate.h"
#import "lbCourseHoleDto.h"
#import "lbGolfPlayDao.h"


@interface lbCourseHoleViewController ()

@property (strong, nonatomic) IBOutlet UILabel *courseNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *holeNumberLbl;
@property (strong, nonatomic) IBOutlet UILabel *holeNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *distanceLbl;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLbl;
@property (strong, nonatomic) IBOutlet UILabel *holeScoreLbl;

@property (strong, nonatomic) IBOutlet UIView *view;

@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *oneFingerSwipeLeft;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *oneFingerSwipeRight;

@property (nonatomic, strong) IBOutlet lbAppDelegate *appDelegate;

@end

@implementation lbCourseHoleViewController


@synthesize course;
@synthesize courseHoleList;
@synthesize holePointer;
@synthesize scoreArray;
@synthesize holeScore;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.appDelegate = (lbAppDelegate*)[[UIApplication sharedApplication] delegate];
    self.course = [self.appDelegate course];
    self.courseHoleList = [course courseHoleMap];
    self.holePointer = 1;
    
    //request the "scorecard id" from the server based on (competition id/course id)
    //&& scorer id (which should be the logged in user)
    [lbGolfPlayDao loadScorecardForCourseId: self.course.courseId andScorerId:@"e88940e6-c730-4165-8fc8-deab01dce9dc"];
    
    //initialise the score array with zeros!
    self.scoreArray = [[NSMutableArray alloc] init];
    for(int i=0; i<[self.courseHoleList count]; i++) {
        [self.scoreArray addObject: [NSNumber numberWithInt:0]];
    }

    //initialise the hole score
    self.holeScore = [NSNumber numberWithInt:0];

    //set the course name;
    self.courseNameLbl.text = [self.course courseName];

    // show the initial hole details
    [self showHoleDetails: holePointer];
    
    // Create and initialize a tap gesture
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showGestureForTapRecognizer:)];
    self.tapRecognizer.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:self.tapRecognizer];

    // Create and initialize swipe left gesture
    self.oneFingerSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeLeft:)];
    [self.oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:self.oneFingerSwipeLeft];
    
    // Create and initialize swipe right gesture
    self.oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeRight:)];
    [self.oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:self.oneFingerSwipeRight];
    
    // Do any additional setup after loading the view, typically from a nib
}

- (void)oneFingerSwipeLeft:(UITapGestureRecognizer *)recognizer {
    
    // hole 1...3 for development 
    // Insert your own code to handle swipe right
    if(self.holePointer < 3) {//(self.course.isNineHole ? 9 : 18)) {
        NSLog(@"score the hole and display the next");
        [self scoreHole: self.holePointer];
        self.holePointer = self.holePointer+1;
        [self updateHoleScore: self.holePointer];
        [self showHoleDetails: self.holePointer];
        
    } else if(self.holePointer == 3) {//(self.course.isNineHole ? 9 : 18)) {
        // score the last hole and diplay the summary
        NSLog(@"score the last hole and display the summary");
        [self scoreHole: self.holePointer];
        
        //TODO! http://www.appcoda.com/storyboards-ios-tutorial-pass-data-between-view-controller-with-segue/
         [self performSegueWithIdentifier:seg_playRoundToRoundOverview sender:self];
        
    }
    NSLog(@"right");

}

- (void)oneFingerSwipeRight:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe left
    if(self.holePointer != 0) {
        [self scoreHole: self.holePointer];
        self.holePointer = self.holePointer-1;
        [self updateHoleScore: self.holePointer];
        [self showHoleDetails: self.holePointer];
    }
    NSLog(@"left");
}

- (IBAction)showGestureForTapRecognizer:(UITapGestureRecognizer *)recognizer {

    // Get the location of the gesture
    CGPoint location = [recognizer locationInView:self.view];
    NSLog([NSString stringWithFormat: @"blah: %f", location.x]);
    self.holeScore = [NSNumber numberWithInt: (self.holeScore.intValue+1)];
    self.holeScoreLbl.text = [self.holeScore stringValue];
}

- (void) scoreHole: (int) holeNumber {
    
    if(self.scoreArray && self.holeScore) {
        [scoreArray replaceObjectAtIndex:(holeNumber-1) withObject:self.holeScore];
    }
}

- (void) updateHoleScore: (int) holeNumber {

    if(self.scoreArray) {
        if([self.scoreArray objectAtIndex:holeNumber-1]) {
            self.holeScore = (NSNumber *)[self.scoreArray objectAtIndex:holeNumber-1];
        }
    }
}

- (void) showHoleDetails: (int) holeNumber {

    // get the hole detail
    lbCourseHoleDto *courseHole = [courseHoleList objectAtIndex:(holeNumber-1)];

    // set the details in the view
    self.holeNumberLbl.text = [NSString stringWithFormat: @"%ld", courseHole.holeNumber];
    self.holeScoreLbl.text = [self.holeScore stringValue];
    self.holeNameLbl.text = courseHole.name;
    self.distanceLbl.text = [NSString stringWithFormat: @"%ld", courseHole.distance];
    self.descriptionLbl.text = courseHole.description;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:seg_playRoundToRoundOverview]) {
        lbRoundOverviewVC *roundOverviewVC = segue.destinationViewController;
        roundOverviewVC.scoreArray = self.scoreArray;
        roundOverviewVC.courseHoleList = self.courseHoleList;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
