//
//  lbAuthView.m
//  Leaderboard
//
//  Created by John D. Gaffney on 1/9/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbBaseView.h"

@implementation lbBaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}
@end
