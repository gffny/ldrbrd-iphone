//
//  lbDetailViewController.m
//  Leaderboard
//
//  Created by John D. Gaffney on 1/7/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbDetailViewController.h"

@interface lbDetailViewController ()

@end

@implementation lbDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playRound:(id)sender forEvent:(UIEvent *)event {
    NSLog(@"play competition round");
    [self performSegueWithIdentifier:seg_roundDetailToPlayRound sender:self];

}

- (IBAction)courseChosen:(id)sender forEvent:(UIEvent *)event {
    NSLog(@"course chosen");
    [self performSegueWithIdentifier:seg_courseDetailToPlayRound sender:self];
}

@end
