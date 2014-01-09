//
//  lbAuthViewController.h
//  Leaderboard
//
//  Created by John D. Gaffney on 1/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lbAuthViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *unameFld;
@property (strong, nonatomic) IBOutlet UITextField *pwordField;
- (IBAction)loginBtn:(id)sender forEvent:(UIEvent *)event;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
