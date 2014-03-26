//
//  lbDetailViewController.h
//  Leaderboard
//
//  Created by John D. Gaffney on 1/7/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lbDetailViewController : UIViewController

- (IBAction)playRound:(id)sender forEvent:(UIEvent *)event;
- (void) observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context;

@end
