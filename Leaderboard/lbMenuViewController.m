//
//  lbMenuViewController.m
//  Leaderboard
//
//  Created by John D. Gaffney on 1/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbMenuViewController.h"
#import "lbCourseChoiceViewController.h"
#import "lbDetailViewController.h"
#import "lbCourseDao.h"

@interface lbMenuViewController ()

@property (strong, nonatomic) IBOutlet UIButton *roundOne;
@property (strong, nonatomic) IBOutlet UIButton *roundTwo;
@property (strong, nonatomic) IBOutlet UIButton *roundThree;
@property (strong, nonatomic) IBOutlet UIButton *roundFour;

@end

@implementation lbMenuViewController

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

- (IBAction)practiceRndBtn:(UIButton *)sender forEvent:(UIEvent *)event {
    NSLog(@"play practice round");
    [self performSegueWithIdentifier:seg_menuToCourseChoice sender:self];

}

// combine these methods into one and have the

- (IBAction)competitionRoundBtn:(UIButton *)sender forEvent:(UIEvent *)event {
    NSLog(@"play practice round");
    // TODO get the courseId or competitionRoundId and use that to get the course
    // in reality, these will be loaded programatically with a map of button (or other UI item) to
    if(sender == self.roundOne){
        [lbCourseDao loadCourseById: @"06262cdb-24cb-4857-a7ff-0e2a035de20b"];
    } else if (sender == self.roundTwo) {
        [lbCourseDao loadCourseById: @"06262cdb-24cb-4857-a7ff-0e2a035de20b"];
    } else if (sender == self.roundThree) {
        [lbCourseDao loadCourseById: @"ac48d44d-8494-4f0c-9694-f515b7eca3fb"];
    } else if (sender == self.roundFour) {
        [lbCourseDao loadCourseById: @"ac48d44d-8494-4f0c-9694-f515b7eca3fb"];
    }
    [self performSegueWithIdentifier:seg_menuToRoundDetail sender:self];
}



@end
