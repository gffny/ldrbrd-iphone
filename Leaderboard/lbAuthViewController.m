//
//  lbAuthViewController.m
//  Leaderboard
//
//  Created by John D. Gaffney on 1/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbAuthViewController.h"

@interface lbAuthViewController ()

@end

@implementation lbAuthViewController

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

- (IBAction)loginBtn:(id)sender forEvent:(UIEvent *)event {
    //TODO login!
    [self performSegueWithIdentifier:seg_loginToHome sender:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
