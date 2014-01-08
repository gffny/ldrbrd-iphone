//
//  lbMenuViewController.m
//  Leaderboard
//
//  Created by John D. Gaffney on 1/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbMenuViewController.h"

@interface lbMenuViewController ()

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
    [self performSegueWithIdentifier:seg_menuToCourseDetail sender:self];

}

- (IBAction)firstCompRndBtn:(UIButton *)sender forEvent:(UIEvent *)event {
    NSLog(@"play practice round");
    [self performSegueWithIdentifier:seg_menuToRoundDetail sender:self];
}

- (IBAction)secondCompRndBtn:(id)sender forEvent:(UIEvent *)event {
    
    //may combine the competition round button events into one and discriminate based on event information
    NSLog(@"play practice round");
    [self performSegueWithIdentifier:seg_menuToRoundDetail sender:self];
}

@end
