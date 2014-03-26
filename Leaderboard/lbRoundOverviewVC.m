//
//  lbRoundOverviewVC.m
//  Leaderboard
//
//  Created by John D. Gaffney on 2/10/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbRoundOverviewVC.h"

@interface lbRoundOverviewVC ()

@property (strong, nonatomic) IBOutlet UICollectionView *resultsTable;

@end

@implementation lbRoundOverviewVC

@synthesize courseHoleList;
@synthesize scoreArray;

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
//    [self.resultsTable
    if(self.scoreArray != NULL) {
        //
        for(NSNumber *key in self.scoreArray) {
            NSLog([key stringValue]);
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
