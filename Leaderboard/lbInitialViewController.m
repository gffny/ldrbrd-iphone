//
//  lbInitialViewController.m
//  Leaderboard
//
//  Created by John D. Gaffney on 1/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbInitialViewController.h"
#import "lbAppDelegate.h"

@interface lbInitialViewController ()

@end


@implementation lbInitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        lbAppDelegate *appDelegate = (lbAppDelegate*)[[UIApplication sharedApplication] delegate];
//        [appDelegate setInitialVC:self];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // implement splash screen here if required
    lbAppDelegate *appDelegate = (lbAppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate setInitialVC: self];
}

-(void) handleBackendOnline: (BOOL) backendOnline withMesssage:(NSString *) message
{
    if(backendOnline) {
        lbAppDelegate *appDelegate = (lbAppDelegate*)[[UIApplication sharedApplication] delegate];

        // check conditions of entry and display appropriate view
        if(appDelegate.USER_VALIDATED) {
            //user is authenticated
            [self performSegueWithIdentifier:seg_entryToHome sender:self];
        } else {
            //user is not authenticatedseg_entryToHome
            [self performSegueWithIdentifier:seg_entryToLogin sender:self];
            //[self performSegueWithIdentifier:seg_entryToHome sender:self];
        }
    } else {
        // SET THE ERROR MESSAGE ON THE SCREEN
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
